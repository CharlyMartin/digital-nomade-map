puts "Destroying all nomads first..."
nomad.destroy_all

puts "Creating a nomad for Paris"
nomad.create first_name: 'Paul', contact: '0646531750', address: '16 villa gaudelet', zip_code: 75011, city: 'Paris', country: 'FR'
