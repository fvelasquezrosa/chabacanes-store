require 'faker'

# Clear existing data (order matters due to associations)
OrderItem.destroy_all if defined?(OrderItem)
Order.destroy_all if defined?(Order)
ProductTag.destroy_all if defined?(ProductTag)
Product.destroy_all
Category.destroy_all
Province.destroy_all

# =========================
# Categories
# =========================
shirts = Category.create!(name: "Shirts")
hoodies = Category.create!(name: "Hoodies")
shorts = Category.create!(name: "Shorts")
accessories = Category.create!(name: "Accessories")

categories = [shirts, hoodies, shorts, accessories]

# =========================
# Products (100+ using Faker)
# =========================
100.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 10.0..100.0),
    stock_quantity: rand(5..50),
    category: categories.sample
  )
end

puts "Created #{Product.count} products across #{Category.count} categories."

# =========================
# Provinces with Tax Rates
# =========================
Province.create!(name: "Alberta", code: "AB", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00)
Province.create!(name: "British Columbia", code: "BC", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00)
Province.create!(name: "Manitoba", code: "MB", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00)
Province.create!(name: "New Brunswick", code: "NB", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15)
Province.create!(name: "Newfoundland and Labrador", code: "NL", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15)
Province.create!(name: "Northwest Territories", code: "NT", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00)
Province.create!(name: "Nova Scotia", code: "NS", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15)
Province.create!(name: "Nunavut", code: "NU", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00)
Province.create!(name: "Ontario", code: "ON", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.13)
Province.create!(name: "Prince Edward Island", code: "PE", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15)
Province.create!(name: "Quebec", code: "QC", gst_rate: 0.05, pst_rate: 0.09975, hst_rate: 0.00)
Province.create!(name: "Saskatchewan", code: "SK", gst_rate: 0.05, pst_rate: 0.06, hst_rate: 0.00)
Province.create!(name: "Yukon", code: "YT", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00)

puts "Created #{Province.count} provinces with tax rates."