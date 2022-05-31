describe Vehicle do
  context "validations" do
    subject { build(:vehicle) }

    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:length) }
    it { should validate_inclusion_of(:type).in_array(Vehicle::TYPES) }
    it { should validate_numericality_of(:length).only_integer }
  end

  context "associations" do
    it { should belong_to(:customer) }
  end
end
