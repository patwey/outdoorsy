feature "customers", js: true do
  let!(:customer) { create(:customer) }
  let!(:vehicle) { create(:vehicle, customer: customer) }

  scenario "user visits customers index" do
    visit "/customers"

    expect(page).to have_text(customer.first_name)
    expect(page).to have_text(customer.last_name)
    expect(page).to have_text(customer.email)
    expect(page).to have_text(vehicle.name)
    expect(page).to have_text(vehicle.kind)
    expect(page).to have_text(vehicle.length)
  end
end
