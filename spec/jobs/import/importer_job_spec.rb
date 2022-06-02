describe Import::ImporterJob, type: :job do
  describe "#perform" do
    let(:customer_import) { create(:customer_import) }

    it "calls the customer import service" do
      ActiveJob::Base.queue_adapter = :test

      expect(Import::Importer).to receive(:new).and_call_original

      described_class.new.perform(customer_import.id)
    end
  end
end
