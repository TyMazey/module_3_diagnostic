require 'rails_helper'

describe SearchFacade do

  it 'exist' do
    facade = SearchFacade.new(nil)

    expect(facade).to be_a(SearchFacade)
  end

  describe 'instance methods' do


  end
end 
