describe 'when a zipcode is sent to the air data service' do
  context 'and it has to use the backup api' do
   it 'gets a response from an api' do
     VCR.use_cassette 'airnow' do
        local_data = AirDataService.new.get_air_quality('98006')

        expect(local_data[:latitude]).to eq("47.562")
        expect(local_data[:longitude]).to eq("-122.3405")
        expect(local_data[:us_aqi]).to eq("15")
        expect(local_data[:city]).to eq("Seattle-Bellevue-Kent Valley")
        expect(local_data[:state]).to eq("WA")
        expect(local_data[:country]).to eq("USA")
        expect(local_data[:zipcode]).to eq("98006")
      end
    end
  end

  context 'it is able to use normal api' do
    it 'gets a response from an api' do
      VCR.use_cassette 'airvisual' do
        local_data = AirDataService.new.get_air_quality('98225')

        expect(local_data[:latitude]).to eq("48.762699")
        expect(local_data[:longitude]).to eq("-122.440201")
        expect(local_data[:us_aqi]).to eq(108)
        expect(local_data[:city]).to eq("Bellingham")
        expect(local_data[:state]).to eq("Washington")
        expect(local_data[:country]).to eq("USA")
        expect(local_data[:zipcode]).to eq("98225")
      end
    end
  end
end
