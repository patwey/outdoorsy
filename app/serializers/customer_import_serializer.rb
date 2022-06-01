class CustomerImportSerializer
  def initialize(source)
    @source = source
  end

  def as_json(options = {})
    if source.is_a?(CustomerImport)
      customer_import_hash(source)
    else
      source.map { |customer_import| customer_import_hash(customer_import) }
    end
  end

  private

  attr_reader :source

  def customer_import_hash(customer_import)
    {
      id: customer_import.id,
      metadata: customer_import.metadata,
      status: customer_import.status,
      created_at: customer_import.created_at,
      updated_at: customer_import.updated_at,
      file: {
        filename: customer_import.file.filename,
      },
    }
  end
end
