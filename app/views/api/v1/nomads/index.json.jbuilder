json.array! @nomads do |nomad|
  json.extract! nomad, :id, :first_name, :email, :occupation, :latitude, :longitude
end
