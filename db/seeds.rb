Product.destroy_all
Category.destroy_all

shirts = Category.create!(name: "Shirts")
hoodies = Category.create!(name: "Hoodies")
shorts = Category.create!(name: "Shorts")
accessories = Category.create!(name: "Accessories")

Product.create!(
  title: "Performance Training Shirt",
  description: "Lightweight breathable shirt designed for intense gym sessions and everyday wear.",
  price: 39.99,
  stock_quantity: 20,
  category: shirts
)

Product.create!(
  title: "Oversized Pump Cover Hoodie",
  description: "Comfortable oversized hoodie perfect for warmups and casual streetwear.",
  price: 69.99,
  stock_quantity: 12,
  category: hoodies
)

Product.create!(
  title: "Flex Fit Shorts",
  description: "Athletic shorts designed for mobility, squats, and high intensity training.",
  price: 44.99,
  stock_quantity: 18,
  category: shorts
)

Product.create!(
  title: "Gym Essentials Tote",
  description: "Durable tote bag for carrying gym gear and daily essentials.",
  price: 29.99,
  stock_quantity: 15,
  category: accessories
)

Product.create!(
  title: "Elite Recovery Hoodie",
  description: "Premium hoodie focused on comfort and recovery after workouts.",
  price: 74.99,
  stock_quantity: 10,
  category: hoodies
)

Product.create!(
  title: "Core Motion Shirt",
  description: "Athletic shirt built for lifting, running, and everyday activewear style.",
  price: 34.99,
  stock_quantity: 25,
  category: shirts
)

Product.create!(
  title: "Runner Performance Shorts",
  description: "Breathable performance shorts for cardio, running, and lower body workouts.",
  price: 41.99,
  stock_quantity: 16,
  category: shorts
)

Product.create!(
  title: "Grip Training Straps",
  description: "Support straps that improve grip during back and pulling exercises.",
  price: 19.99,
  stock_quantity: 30,
  category: accessories
)

Product.create!(
  title: "Classic Logo Shirt",
  description: "Minimalist athletic shirt with a clean logo and comfortable fit.",
  price: 32.99,
  stock_quantity: 22,
  category: shirts
)

Product.create!(
  title: "Heavyweight Street Hoodie",
  description: "Heavyweight hoodie combining gym culture and lifestyle streetwear.",
  price: 79.99,
  stock_quantity: 8,
  category: hoodies
)