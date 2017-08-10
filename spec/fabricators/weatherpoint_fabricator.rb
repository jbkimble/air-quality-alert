Fabricator(:weatherPoint) do
  city Faker::Address.city
  state Faker::Address.state
  country Faker::Address.country
  zipcode Faker::Address.zip_code
  us_aqi Faker::Number.between(1, 200)
  china_aqi Faker::Number.between(1, 200)
  rating Faker::Number.digit
  latitude Faker::Number.digit
  longitude Faker::Number.digit
end
