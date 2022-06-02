describe Api::V1::CustomersController do
  describe "GET index" do
    before do
      2.times do |n|
        create(:customer, email: "test#{n}@email.com") do |c|
          create(:vehicle, customer: c)
        end
      end
    end

    it "returns customers and their vehicles" do
      get :index

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)["data"]

      Customer.includes(:vehicles).each do |customer|
        customer_data = data.detect { |d| d["id"] == customer.id }

        expect(customer_data).to be_present
        expect(customer_data["email"]).to eq(customer.email)
        expect(customer_data["first_name"]).to eq(customer.first_name)
        expect(customer_data["last_name"]).to eq(customer.last_name)

        customer.vehicles.each do |vehicle|
          vehicle_data = customer_data["vehicles"].detect { |d| d["id"] == vehicle.id }

          expect(vehicle_data).to be_present
          expect(vehicle_data["name"]).to eq(vehicle.name)
          expect(vehicle_data["kind"]).to eq(vehicle.kind)
          expect(vehicle_data["length"]).to eq(vehicle.length)
          expect(vehicle_data["customer_id"]).to eq(vehicle.customer_id)
        end

      end
    end
  end
end
