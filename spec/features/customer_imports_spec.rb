feature "customer imports", js: true do
  scenario "user visits new customer import form" do
    visit "/customer_imports/new"

    expect(page).to have_field("File")
    expect(page).to have_button("Submit")
  end

  scenario "user submits new customer import form" do
    visit "/customer_imports/new"

    attach_file("file", "#{Rails.root}/spec/fixtures/pipes.txt")
    click_button("Submit")

    expect(page).to have_text("pipes.txt | pending")
  end
end
