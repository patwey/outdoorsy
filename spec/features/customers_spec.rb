describe "customers", js: true do
  let!(:customer) { create(:customer) }
  let!(:vehicle) { create(:vehicle, customer: customer) }

  it "user visits customers index" do
    visit "/customers"

    expect(page.has_text?(customer.first_name)).to be(true)
    expect(page.has_text?(customer.last_name)).to be(true)
    expect(page.has_text?(customer.email)).to be(true)
    expect(page.has_text?(vehicle.name)).to be(true)
    expect(page.has_text?(vehicle.kind)).to be(true)
    expect(page.has_text?(vehicle.length)).to be(true)
  end
end
