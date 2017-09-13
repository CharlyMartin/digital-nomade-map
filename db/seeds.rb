# !!!comment the vaidation for address in order to make in work
puts "Starting"

puts "Destroying all nomads"
Nomad.destroy_all


puts "Creating myself"
# Myself
Nomad.create(
  first_name: "Charly",
  last_name: "Martin",
  username: "CharlyMartin",
  gender: 2,
  email: "charly.martin.1207@gmail.com",
  password: "123soleil",
  latitude: -33.880428,
  longitude: 151.2004518
)

puts "Creating randies"
# Random Users
50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  nomad = Nomad.create(
    first_name: first_name,
    last_name: last_name,
    username: first_name.capitalize + last_name.capitalize,
    gender: rand(1..2),
    email: Faker::Internet.email,
    password: Faker::Crypto.md5,
    # address: Faker::Address.street_address,
    # zip_code: Faker::Address.postcode,
    # city: Faker::Address.city,
    # country: Faker::Address.country,
    latitude: rand(45..50),
    longitude: rand(5..30)
  )
  puts "- nomad #{nomad.id} created!"
end

puts "All Done"
