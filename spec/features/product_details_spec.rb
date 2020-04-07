require 'rails_helper'

RSpec.feature "Visitor navigates to product page by clicking link from home page", type: :feature, js: true do

# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
end

scenario "They see product description and quantity" do
  # ACT
  visit root_path
  page.find('.product', match: :first).first('a').click
  
  # VERIFY
  expect(page).to have_content "Description", wait: 10 
  expect(page).to have_content "Quantity", wait: 10 

end
end