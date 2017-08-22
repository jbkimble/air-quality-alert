require 'rails_helper'

describe WeatherPoint do
  context 'validate attributes' do
    it 'is valid with city, state, country, zipcode, airquality, and rating' do
      measurement = Fabricate.build(:weatherPoint)

      expect(measurement).to be_valid
    end
  end

  context 'invalid attributes' do
    it 'is invalid without city' do
      measurement = Fabricate.build(:weatherPoint, city: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without state' do
      measurement = Fabricate.build(:weatherPoint, state: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without country' do
      measurement = Fabricate.build(:weatherPoint, country: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without zipcode' do
      measurement = Fabricate.build(:weatherPoint, zipcode: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without aqi' do
      measurement = Fabricate.build(:weatherPoint, us_aqi: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without rating' do
      measurement = Fabricate.build(:weatherPoint, air_index_id: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without latitude' do
      measurement = Fabricate.build(:weatherPoint, latitude: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without longitude' do
      measurement = Fabricate.build(:weatherPoint, longitude: nil)
      expect(measurement).to be_invalid
    end
  end

  context 'test methods' do
    scenario 'get_rating method returns proper rating' do
      rating_good = WeatherPoint.get_us_rating(5)
      rating_moderate = WeatherPoint.get_us_rating(51)
      rating_unhealthy_1 = WeatherPoint.get_us_rating(121)
      rating_unhealthy_11 = WeatherPoint.get_us_rating(150)
      rating_unhealthy_2 = WeatherPoint.get_us_rating(151)
      rating_very_unhealthy = WeatherPoint.get_us_rating(222)
      rating_hazardous = WeatherPoint.get_us_rating(330)
      invalid_1 = WeatherPoint.get_us_rating(501)
      invalid_2 = WeatherPoint.get_us_rating(-1)

      expect(rating_good).to eq(1)
      expect(rating_moderate).to eq(2)
      expect(rating_unhealthy_1).to eq(3)
      expect(rating_unhealthy_11).to eq(3)
      expect(rating_unhealthy_2).to eq(4)
      expect(rating_very_unhealthy).to eq(5)
      expect(rating_hazardous).to eq(6)
      expect(invalid_1).to eq(7)
      expect(invalid_2).to eq(7)
    end
  end
end
