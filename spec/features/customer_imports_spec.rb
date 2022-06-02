describe "customer imports", js: true do
  it "user visits new customer import form" do
    visit "/customer_imports/new"

    expect(page.has_field?("File")).to be(true)
    expect(page.has_button?("Submit", disabled: true)).to be(true)
  end

  it "user submits new customer import form" do
    visit "/customer_imports/new"

    attach_file("file", "#{Rails.root}/spec/fixtures/pipes.txt")
    click_button("Submit")

    expect(page.has_text?("pipes.txt")).to be(true)
    expect(page.has_text?("pending")).to be(true)
  end
end
