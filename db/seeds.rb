# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ItemOrder.destroy_all
Item.destroy_all
Order.destroy_all
Merchant.destroy_all

#users
user = User.create(name: "Regular User",
            street_address: "1765 Larimer St",
            city: "Denver",
            state: "CO",
            zip: "80202",
            email: "user@example.com",
            password: "password",
            password_confirmation: "password",
            role: 0)

merchant = User.create(name: "Merchant User",
            street_address: "1765 Larimer St",
            city: "Denver",
            state: "CO",
            zip: "80202",
            email: "merchant@example.com",
            password: "password",
            password_confirmation: "password",
            role: 1)

admin = User.create(name: "Admin User",
            street_address: "1765 Larimer St",
            city: "Denver",
            state: "CO",
            zip: "80202",
            email: "admin@example.com",
            password: "password",
            password_confirmation: "password",
            role: 2)

#merchants
bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)

#bike_shop items
tire = bike_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)

#dog_shop items
pull_toy = dog_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
dog_bone = dog_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21)
tire_2 = dog_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
pull_toy_2 = bike_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
tire_3 = dog_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
pull_toy_3 = bike_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
tire_4 = dog_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
pull_toy_4 = bike_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
tire_5 = dog_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
pull_toy_5 = bike_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
tire_6 = dog_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
pull_toy_6 = bike_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)

#orders & order items
order_1 = Order.create(name: "Javi", address: "1111 Rails St.", city: "Denver", state: "CO", zip: "80201", user_id: user.id)
ItemOrder.create(order_id: order_1.id, item_id: tire_2.id, price: 1.99, quantity: 5004)
ItemOrder.create(order_id: order_1.id, item_id: tire_3.id, price: 1.99, quantity: 5003)
ItemOrder.create(order_id: order_1.id, item_id: tire_4.id, price: 1.99, quantity: 5002)
ItemOrder.create(order_id: order_1.id, item_id: tire_5.id, price: 1.99, quantity: 5001)
ItemOrder.create(order_id: order_1.id, item_id: tire_6.id, price: 1.99, quantity: 5000)
ItemOrder.create(order_id: order_1.id, item_id: tire.id, price: 1.99, quantity: 200)

order_2 = Order.create(name: "Alex", address: "1111 Rails St.", city: "Denver", state: "CO", zip: "80201", user_id: user.id)
ItemOrder.create(order_id: order_2.id, item_id: dog_bone.id, price: 1.99, quantity: 200)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy.id, price: 1.99, quantity: 200)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy_2.id, price: 1.99, quantity: 4)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy_3.id, price: 1.99, quantity: 3)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy_4.id, price: 1.99, quantity: 2)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy_5.id, price: 1.99, quantity: 1)
ItemOrder.create(order_id: order_2.id, item_id: pull_toy_6.id, price: 1.99, quantity: 10)

order_3 = Order.create(name: "Ana", address: "1111 Rails St.", city: "Denver", state: "CO", zip: "80201", user_id: user.id)
ItemOrder.create(order_id: order_3.id, item_id: tire_6.id, price: 1.99, quantity: 5000)
ItemOrder.create(order_id: order_3.id, item_id: pull_toy.id, price: 1.99, quantity: 200)
ItemOrder.create(order_id: order_3.id, item_id: tire_6.id, price: 1.99, quantity: 5000)
ItemOrder.create(order_id: order_3.id, item_id: pull_toy_3.id, price: 1.99, quantity: 3)
ItemOrder.create(order_id: order_3.id, item_id: tire_6.id, price: 1.99, quantity: 5000)
ItemOrder.create(order_id: order_3.id, item_id: pull_toy_5.id, price: 1.99, quantity: 1)
ItemOrder.create(order_id: order_3.id, item_id: pull_toy_6.id, price: 1.99, quantity: 5)
