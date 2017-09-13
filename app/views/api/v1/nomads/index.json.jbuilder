json.array! @nomad do |nomad|
  json.extract! nomad, :id, :name, :address
end
