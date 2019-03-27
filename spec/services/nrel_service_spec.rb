require 'rails_helper'

describe 'nrel service' do

  it 'exist' do
    service = NRELService.new(nil)

    expect(service).to be_a(NRELService)
  end

  describe 'instance methods' do
    describe '.get_stations' do
      it 'returns json for stations by zip code' do
        VCR.use_cassette("services/NRELService") do
          result = NRELService.new("80206").get_stations

          expected = {}

          expect(result).to be_a(Hash)
          expect(result).to have_key("total_results")
          expect(result).to have_key("station_counts")
          expect(result).to have_key("fuel_stations")
          expect(result["fuel_stations"]).to be_a(Array)
        end
      end
    end
  end
end
