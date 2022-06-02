class CustomerSerializer
  def initialize(source)
    @source = source
  end

  def as_json(_options = {})
    if source.is_a?(Customer)
      customer_hash(source)
    else
      source.map { |customer| customer_hash(customer) }
    end
  end

  private

  attr_reader :source

  def customer_hash(customer)
    {
      id: customer.id,
      email: customer.email,
      first_name: customer.first_name,
      last_name: customer.last_name,
      created_at: customer.created_at,
      updated_at: customer.updated_at,
      vehicles: VehicleSerializer.new(customer.vehicles),
    }
  end
end
