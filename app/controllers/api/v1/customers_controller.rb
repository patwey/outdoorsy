module Api
  module V1
    class CustomersController < Api::V1::BaseController
      def index
        customers = Customer.includes(:vehicles).order(:last_name, "vehicles.name")

        json_response(CustomerSerializer.new(customers))
      end
    end
  end
end
