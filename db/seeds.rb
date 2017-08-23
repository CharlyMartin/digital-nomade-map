# !!!comment the vaidation for address in order to make in work
puts "Starting"

puts "Destroying all nomads"
Nomad.destroy_all



puts "Creating myself"
# Myself
Nomad.create(
  first_name: "Charly",
  last_name: "Martin",
  email: "charly.martin.1207@gmail.com",
  password: "RueTurenne90",
  latitude: -33.880428,
  longitude: 151.2004518
)

puts "Creating randies"
# Random Users
300.times do
  nomad = Nomad.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Crypto.md5,
    # address: Faker::Address.street_address,
    # zip_code: Faker::Address.postcode,
    # city: Faker::Address.city,
    # country: Faker::Address.country,
    latitude: rand(-90.0...90.0),
    longitude: rand(-180.0...180.0)
  )
  puts "- nomad #{nomad.id} created!"
end

puts "All Done"

