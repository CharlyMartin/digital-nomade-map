# puts "Destroying all nomads first..."
# Nomad.destroy_all

# puts "Creating a nomad for Paris"
# Nomad.create first_name: 'Paul', phone: '0', address: '41 Rue Réaumur', zip_code: 75011, city: 'Paris', country: 'FR'

# Nomad.destroy_all

Nomad.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Hipster.sentence(2),
  city: Faker::Address.city,
  country: Faker::Address.country
  )
puts 'nomad created'
