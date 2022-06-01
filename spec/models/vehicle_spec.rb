describe Vehicle do
  context "validations" do
    subject { build(:vehicle) }

    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:length) }
    it { should validate_inclusion_of(:kind).in_array(described_class::KINDS) }
    it { should validate_numericality_of(:length).only_integer }
  end

  context "associations" do
    it { should belong_to(:customer) }
  end
end
