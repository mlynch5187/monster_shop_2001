require 'rails_helper'

RSpec.describe "As a merchant employee, when I click 'create discount' on a discount showpage" do
  before(:each) do
    @bike_shop = Merchant.create(name: "Brian's Bike Shop",
                                 address: '123 Bike Rd.',
                                 city: 'Richmond',
                                 state: 'VA',
                                 zip: 23137,
                                 active: true)

    @employee = User.create(name: "Mike Dao",
               street_address: "1765 Larimer St",
               city: "Denver",
               state: "CO",
               zip: "80202",
               email: "mike@example.com",
               password: "123456",
               password_confirmation: "123456",
               role: 1,
               merchant_id: @bike_shop.id)

    @tire = @bike_shop.items.create(name: "Bike Tire",
                            description: "They'll never pop!",
                            price: 200,
                            image: "https://mk0completetrid5cejy.kinstacdn.com/wp-content/uploads/2013-Shimano-Wheels-WH9000-C50-tubular-clincher.jpg",
                            inventory: 10)
    @helmet = @bike_shop.items.create(name: "Bike Helmet",
                            description: "They'll never crack!",
                            price: 100,
                            image: "https://cdn.shopify.com/s/files/1/0836/6919/products/vintage_bike_helmet_001_2000x.jpg?v=1585087482",
                            inventory: 12)

    @discount_1 = @bike_shop.discounts.create(name: "Buy Three, Get 10% Off",
                                              percentage: 0.1,
                                              bulk: 3,
                                              description: "If you buy three of our items in one order, a 10% discount is applied")

    @discount_2 = @bike_shop.discounts.create(name: "Buy Five, Get 15% Off",
                                              percentage: 0.15,
                                              bulk: 5,
                                              description: "If you buy five of our items in one order, a 15% discount is applied")

    visit "/login"

    fill_in :email, with: @employee.email
    fill_in :password, with: "123456"

    click_button "Login"
    visit "/merchant"

    click_link "Create Discount"
  end

  it "shows a form where I can create a discount" do

    expect(current_path).to eq("/merchant/discounts")

    expect(find_field('Name').value)
    expect(find_field('Percentage').value)
    expect(find_field('Bulk').value)
    expect(find_field('Description').value)
  end

  it "creates a discount when submitted with required forms filled in" do

    fill_in 'Name', with: "Buy Ten, Get 20% Off"
    fill_in 'Percentage', with: "0.2"
    fill_in 'Bulk', with: "10"
    fill_in 'Description', with: "If you buy ten of our items in one order, a 20% discount is applied"

    click_button "Create Discount"

    expect(current_path).to eq("/merchant")
    expect(page).to have_link("Buy Ten, Get 20% Off")
  end

  it "flashes an error message if form isn't completely filled in" do

    fill_in 'Name', with: "Buy Ten, Get 20% Off"
    fill_in 'Percentage', with: ""
    fill_in 'Bulk', with: "10"
    fill_in 'Description', with: "If you buy ten of our items in one order, a 20% discount is applied"

    click_button "Create Discount"

    expect(page).to have_content("Percentage can't be blank")
  end
end
