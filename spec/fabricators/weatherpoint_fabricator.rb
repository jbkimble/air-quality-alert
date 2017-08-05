Fabricator(:weatherPoint) do
  city Faker::Address.city
  state Faker::Address.state
  country Faker::Address.country
  zipcode Faker::Address.zip_code
  aqi Faker::Number.between(1, 200)
  rating Faker::Number.digit
end
