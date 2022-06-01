class CustomerImport::ImporterJob < ApplicationJob
  def perform(customer_import_id)
    customer_import = CustomerImport.find(customer_import_id)

    CustomerImport::Importer.new(customer_import).run
  end
end
