describe Customer do
  subject { build(:customer) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value("test123@email.org").for(:email) }
  it { is_expected.not_to allow_value("test123@email").for(:email) }
  it { is_expected.to have_many(:vehicles).dependent(:destroy) }
  it { is_expected.to belong_to(:customer_import) }
end
