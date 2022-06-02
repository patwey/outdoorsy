describe CustomerImport do
  subject(:customer_import) { build(:customer_import) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_inclusion_of(:status).in_array(described_class::STATUSES) }
  it { is_expected.to have_one_attached(:file) }
  it { is_expected.to have_many(:customers) }

  it "validates presence of a file" do
    customer_import.file.purge

    expect(customer_import.valid?).to be(false)
  end

  describe "#process" do
    let(:customer_import) { create(:customer_import) }

    it "enqueues a customer import job", type: :job do
      ActiveJob::Base.queue_adapter = :test

      customer_import.process

      expect(Import::ImporterJob).to have_been_enqueued.with(customer_import.id)
    end
  end

  describe "#processing!" do
    let(:customer_import) { create(:customer_import, status: CustomerImport::PENDING) }

    it "updates status to processing" do
      customer_import.processing!

      expect(customer_import.status).to eq(CustomerImport::PROCESSING)
    end
  end
end
