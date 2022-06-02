class VehicleSerializer
  def initialize(source)
    @source = source
  end

  def as_json(_options = {})
    if source.is_a?(Vehicle)
      vehicle_hash(source)
    else
      source.map { |vehicle| vehicle_hash(vehicle) }
    end
  end

  private

  attr_reader :source

  def vehicle_hash(vehicle)
    {
      id: vehicle.id,
      customer_id: vehicle.customer_id,
      name: vehicle.name,
      kind: vehicle.kind,
      length: vehicle.length,
      created_at: vehicle.created_at,
      updated_at: vehicle.updated_at,
    }
  end
end
