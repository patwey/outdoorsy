describe CustomerImport::Importer do
  describe "#run" do
    context "given a customer import with a comma separated file" do
      let(:customer_import) { create(:customer_import, :comma_separated_file) }
      let(:expected_customers) do
        [
          {
            first_name: "Greta",
            last_name: "Thunberg",
            email: "greta@future.com"
          },
          {
            first_name: "Xiuhtezcatl",
            last_name: "Martinez",
            email: "martinez@earthguardian.org",
          },
          {
            first_name: "Mandip",
            last_name: "Singh Soin",
            email: "mandip@ecotourism.net",
          },
          {
            first_name: "Jimmy",
            last_name: "Buffet",
            email: "jb@sailor.com",
          },
        ]
      end

      let(:expected_vehicles) do
        [
          {
            kind: Vehicle::SAILBOAT,
            name: "Fridays For Future",
            length: 32,
            customer: { email: "greta@future.com" },
          },
          {
            kind: Vehicle::CAMPERVAN,
            name: "Earth Guardian",
            length: 28,
            customer: { email: "martinez@earthguardian.org" },
          },
          {
            kind: Vehicle::MOTORBOAT,
            name: "Frozen Trekker",
            length: 32,
            customer: { email: "mandip@ecotourism.net" },
          },
          {
            kind: Vehicle::SAILBOAT,
            name: "Margaritaville",
            length: 40,
            customer: { email: "jb@sailor.com" },
          },
        ]
      end

      it "creates customers" do
        described_class.new(customer_import).run

        expected_customers.each do |attributes|
          expect(Customer.find_by(attributes)).to be_present
        end
      end

      it "creates vehicles" do
        described_class.new(customer_import).run

        expected_vehicles.each do |attributes|
          v = Vehicle.joins(:customer).find_by(attributes)

          expect(v).to be_present
        end
      end

      it "updates customer import status" do
        described_class.new(customer_import).run

        expect(customer_import.status).to eq(CustomerImport::COMPLETE)
      end

      it "updates customer import metadata" do
        described_class.new(customer_import).run

        expect(customer_import.metadata["success"]).to be_a(Array)
        expect(customer_import.metadata).to have_key("error")
      end
    end

    context "given a customer import with a pipe separated file" do
      let(:customer_import) { create(:customer_import, :pipe_separated_file) }
      let(:expected_customers) do
        [
          {
            first_name: "Ansel",
            last_name: "Adams",
            email: "a@adams.com",
          },
          {
            first_name: "Steve",
            last_name: "Irwin",
            email: "steve@crocodiles.com",
          },
          {
            first_name: "Isatou",
            last_name: "Ceesay",
            email: "isatou@recycle.com",
          },
          {
            first_name: "Naomi",
            last_name: "Uemura",
            email: "n.uemura@gmail.com",
          },
        ]
      end

      let(:expected_vehicles) do
        [
          {
            kind: "motorboat",
            name: "Rushing Water",
            length: 24,
            customer: { email: "a@adams.com" },
          },
          {
            kind: "rv",
            name: "G’Day For Adventure",
            length: 32,
            customer: { email: "steve@crocodiles.com" },
          },
          {
            kind: "campervan",
            name: "Plastic To Purses",
            length: 20,
            customer: { email: "isatou@recycle.com" },
          },
          {
            kind: "bicycle",
            name: "Glacier Glider",
            length: 5,
            customer: { email: "n.uemura@gmail.com" },
          },
        ]
      end

      it "creates customers" do
        described_class.new(customer_import).run

        expected_customers.each do |attributes|
          expect(Customer.find_by(attributes)).to be_present
        end
      end

      it "creates vehicles" do
        described_class.new(customer_import).run

        expected_vehicles.each do |attributes|
          v = Vehicle.joins(:customer).find_by(attributes)

          expect(v).to be_present
        end
      end

      it "updates customer import status" do
        described_class.new(customer_import).run

        expect(customer_import.status).to eq(CustomerImport::COMPLETE)
      end

      it "updates customer import metadata" do
        described_class.new(customer_import).run

        expect(customer_import.metadata["success"]).to be_a(Array)
        expect(customer_import.metadata).to have_key("error")
      end
    end
  end
end
