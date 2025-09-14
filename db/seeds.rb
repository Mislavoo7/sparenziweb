
Admin.create(
  email: "kvesic.mislav@gmail.com",
  password: "xxxxxxxxxxxxxxxxxxx",
)
puts "++++ Admin Seeded"

require_relative "seed_methods/seed_pages"
require_relative "seed_methods/seed_legal_pages"
require_relative "seed_methods/seed_lists"

seed_home
puts "++++ Home Page Seeded"
seed_about
puts "++++ About Page Seeded"

seed_legal_pages
puts "++++ Legal pages Seeded"

user = User.create(
  email: "kvesic.mislav@gmail.com",
  password: "XXXXXXXX",
)
puts "++++ User Seeded"

seed_lists(User.first)
puts "++++ List Seeded"
