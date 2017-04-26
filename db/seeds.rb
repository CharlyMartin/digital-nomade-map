# !!!comment the vaidation for address in order to make in work

# Nomad.destroy_all
count = 0

50.times do
  Nomad.create(
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
  puts count = count + 1
end
