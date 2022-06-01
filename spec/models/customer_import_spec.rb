describe CustomerImport do
  context "validations" do
    subject { build(:customer_import) }

    it { should be_valid }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(described_class::STATUSES) }

    it "validates presence of a file" do
      subject.file.purge

      expect(subject).not_to be_valid
    end
  end

  context "associations" do
    it { should have_one_attached(:file) }
  end

  describe "#process" do
    subject { create(:customer_import) }

    it "enqueues a customer import job", type: :job do
      ActiveJob::Base.queue_adapter = :test

      subject.process

      expect(CustomerImport::ImporterJob).to have_been_enqueued.with(subject.id)
    end
  end

  describe "#processing!" do
    subject { create(:customer_import, status: CustomerImport::PENDING) }

    it "updates status to processing" do
      subject.processing!

      expect(subject.status).to eq(CustomerImport::PROCESSING)
    end
  end
end
