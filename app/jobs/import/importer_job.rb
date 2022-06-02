module Import
  class ImporterJob < ApplicationJob
    def perform(customer_import_id)
      customer_import = CustomerImport.find(customer_import_id)

      Import::Importer.new(customer_import).run
    end
  end
end
