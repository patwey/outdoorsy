describe Api::V1::CustomerImportsController do
  describe "GET index" do
    before do
      ActiveJob::Base.queue_adapter = :test
      3.times { create(:customer_import) }
    end

    it "returns all customer imports" do
      get :index

      data = JSON.parse(response.body)["data"]

      expect(data).to be_a(Array)
      expect(response).to have_http_status(:ok)

      CustomerImport.all.each do |customer_import|
        record = data.detect { |d| d["id"] == customer_import.id }

        expect(record["metadata"]).to eq(customer_import.metadata)
        expect(record["status"]).to eq(customer_import.status)
        expect(record["created_at"]).to eq(customer_import.created_at.as_json)
        expect(record["updated_at"]).to eq(customer_import.updated_at.as_json)
        expect(record["file"]["filename"]).to eq(customer_import.file.filename.to_s)
      end
    end
  end

  describe "POST create" do
    let(:file) do
      Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/pipes.txt", "txt")
    end

    it "creates a customer import" do
      expect { post :create, params: { file: file } }.to change { CustomerImport.count }.by(1)

      expect(response).to have_http_status(:created)

      record = JSON.parse(response.body)["data"]

      expect(record).to be_a(Hash)
      expect(record["status"]).to eq("pending")
      expect(record["file"]["filename"]).to eq(file.original_filename)
    end
  end
end
