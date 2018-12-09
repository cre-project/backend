json.array! @addresses do |address|
  json.id address.id
  json.street_name address.street_name
  json.street_number address.street_number
  json.city address.city
  json.state address.state
  json.zip address.zip
end
