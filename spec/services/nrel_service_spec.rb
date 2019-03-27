require 'rails_helper'

describe 'nrel service' do

  it 'exist' do
    service = NRELService.new(nil)

    expect(service).to be_a(NRELService)
  end

  describe 'instance methods' do
    describe '.get_stations' do
      it 'returns json for stations by zip code' do
        result = NRELService.new("80206").get_stations

        expected = {}
        
        expect(result).to eq(expected)
      end
    end
  end
end
