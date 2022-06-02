describe Vehicle do
  subject { build(:vehicle) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:length) }
  it { is_expected.to validate_inclusion_of(:kind).in_array(described_class::KINDS) }
  it { is_expected.to validate_numericality_of(:length).only_integer }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:customer_id).case_insensitive }
  it { is_expected.to belong_to(:customer) }
end
