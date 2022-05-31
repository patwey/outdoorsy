describe Customer do
  context "validations" do
    subject { build(:customer) }

    it { should be_valid }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("test123@email.org").for(:email) }
    it { should_not allow_value("test123@email").for(:email) }
  end
end
