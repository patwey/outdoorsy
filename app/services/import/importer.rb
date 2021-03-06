require "csv"

module Import
  class Importer
    def initialize(customer_import)
      @customer_import = customer_import
      @success = []
      @error = []
    end

    def run
      customer_import.processing!
      data = customer_import.file.download

      standardized_data = standardize(data)
      import(standardized_data)

      complete_customer_import
    end

    private

    attr_reader :customer_import, :success, :error

    def standardize(data)
      Import::DataStandardizer.new(data).run
    end

    def import(data)
      CSV.parse(data) do |row|
        data_hash = Import::FileSchema::COLUMNS.zip(row).to_h

        ApplicationRecord.transaction do
          customer = create_customer(data_hash)
          create_vehicle(data_hash, customer)
        end

        success << { row: row }
      rescue StandardError => e
        error << { row: row, message: e.message }
      end
    end

    def standardize_vehicle_attributes(attributes)
      attributes[:kind] = Import::DataStandardizer.standardize_kind(attributes[:kind])
      attributes[:length] = Import::DataStandardizer.standardize_length(attributes[:length])
      attributes
    end

    def create_customer(data)
      customer_attributes = customer_attributes(data)
      customer = Customer.find_by(email: customer_attributes[:email])

      if customer
        customer.update!(customer_attributes)
      else
        customer = Customer.create!(customer_attributes)
      end

      customer
    end

    def customer_attributes(data)
      data
        .slice(*Import::FileSchema::CUSTOMER_COLUMNS)
        .merge({ customer_import_id: customer_import.id })
    end

    def create_vehicle(data, customer)
      vehicle_attributes = data.slice(*Import::FileSchema::VEHICLE_COLUMNS)
      standardized_vehicle_attributes = standardize_vehicle_attributes(vehicle_attributes)
      customer.vehicles.create!(standardized_vehicle_attributes)
    end

    def complete_customer_import
      customer_import.update(
        status: CustomerImport::COMPLETE,
        metadata: { success: success, error: error },
      )
    end
  end
end
