feature "customer imports", js: true do
  scenario "user visits new customer import form" do
    visit "/customer_imports/new"

    expect(page).to have_field("File")
    expect(page).to have_button("Submit")
  end
end
