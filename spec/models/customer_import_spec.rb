describe CustomerImport do
  context "validations" do
    subject { build(:customer_import) }

    it { should be_valid }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(CustomerImport::STATUSES) }

    it "validates presence of a file" do
      subject.file.purge

      expect(subject).not_to be_valid
    end
  end

  context "associations" do
    it { should have_one_attached(:file) }
  end
end
