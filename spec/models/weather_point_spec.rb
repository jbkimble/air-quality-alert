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

    it 'is invalid without airquality' do
      measurement = Fabricate.build(:weatherPoint, airquality: nil)
      expect(measurement).to be_invalid
    end

    it 'is invalid without rating' do
      measurement = Fabricate.build(:weatherPoint, rating: nil)
      expect(measurement).to be_invalid
    end
  end
end
