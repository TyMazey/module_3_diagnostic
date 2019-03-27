require 'rails_helper'

describe 'SearchFacade' do

  describe 'class' do
    it 'exist' do
      facade = SearchFacade.new("params")

      expect(facade).to be_a(SearchFacade)
    end
  end

  describe 'instance methods' do
    describe '.result_count' do
      it 'can return the total of a search result' do
        facade = SearchFacade.new("80206")

        expect(facade.result_count).to eq(15)
      end
    end

    describe '.stations' do
      it 'returns a list of stations within 5 miles of a zip code' do
        facade = SearchFacade.new("80206")

        expect(facade.stations).to be_a(Array)
        expect(facade.stations.first).to be_a(Station)
      end
    end
  end
end
