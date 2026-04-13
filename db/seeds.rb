require 'faker'

Product.destroy_all
Category.destroy_all

shirts = Category.create!(name: "Shirts")
hoodies = Category.create!(name: "Hoodies")
shorts = Category.create!(name: "Shorts")
accessories = Category.create!(name: "Accessories")

categories = [shirts, hoodies, shorts, accessories]

100.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 10.0..100.0),
    stock_quantity: rand(5..50),
    category: categories.sample
  )
end