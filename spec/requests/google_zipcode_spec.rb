describe 'When I send a zipcode to google api' do
   it 'returns correct latitude and longitude' do
     VCR.use_cassette 'google_zipcode' do
       lat_lng = LatLongService.get_lat_long('98006')
       
       expect(lat_lng[:lat]).to eq(47.55770769999999)
       expect(lat_lng[:lng]).to eq(-122.1277465)
     end
   end
end
