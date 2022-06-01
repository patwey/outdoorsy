class CustomerImportsController < ApplicationController
  def new
  end

  def create
    customer_import = CustomerImport.new(status: CustomerImport::PENDING)
    customer_import.file.attach(customer_import_params["file"])

    if customer_import.save
      # TODO: customer_import.process
      json_response(CustomerImportSerializer.new(customer_import), :created)
    else
      json_response({ errors: customer_import.errors.full_messages }, :bad_request)
    end
  end

  def index
    customer_imports = CustomerImport.all.order(created_at: :desc)

    json_response(CustomerImportSerializer.new(customer_imports))
  end

  private

  def customer_import_params
    params.permit("file")
  end
end
