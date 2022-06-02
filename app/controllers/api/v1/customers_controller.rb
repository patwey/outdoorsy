class Api::V1::CustomersController < Api::V1::BaseController
  def index
    customers = Customer.includes(:vehicles).order(:last_name, "vehicles.name")

    json_response(CustomerSerializer.new(customers))
  end
end
