require 'rails_helper'

RSpec.describe "As a merchant employee, when I visit discounts index" do
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
                                              percentage: 0.1)

    @discount_2 = @bike_shop.discounts.create(name: "Buy Five, Get 15% Off",
                                              percentage: 0.15)

    visit "/login"

    fill_in :email, with: @employee.email
    fill_in :password, with: "123456"

    click_button "Login"
    visit "/merchant"
  end

  it "shows all discount names as links to discount showpage" do

      expect(page).to have_link("#{@discount_1.name}")
      expect(page).to have_link("#{@discount_2.name}")

      within("#discount-#{@discount_1.id}") do
        click_link "#{@discount_1.name}"
      end

      expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}")
  end
end