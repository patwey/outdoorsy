require "csv"

class CustomerImport::Importer
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
    CustomerImport::DataStandardizer.new(data).run
  end

  def import(data)
    CSV.parse(data) do |row|
      data_hash = CustomerImport::FileSchema::COLUMNS.zip(row).to_h

      ApplicationRecord.transaction do
        customer = create_customer(data_hash)
        vehicle = create_vehicle(data_hash, customer)
      end

      success << { row: row }
    rescue => e
      error << { row: row, message: e.message }
    end
  end

  def standardize_vehicle_attributes(attributes)
    attributes[:kind] = CustomerImport::DataStandardizer.standardize_kind(attributes[:kind])
    attributes[:length] = CustomerImport::DataStandardizer.standardize_length(attributes[:length])
    attributes
  end

  def create_customer(data)
    customer_attributes = data.slice(*CustomerImport::FileSchema::CUSTOMER_COLUMNS)
    customer = Customer.create!(customer_attributes)
  end

  def create_vehicle(data, customer)
    vehicle_attributes = data.slice(*CustomerImport::FileSchema::VEHICLE_COLUMNS)
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
