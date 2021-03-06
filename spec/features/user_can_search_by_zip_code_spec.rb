require 'rails_helper'

describe 'as user' do

  it 'lets me search for stations by my zip code' do
    VCR.use_cassette("views/search") do

      visit '/'

      fill_in :q, with: '80206'
      click_on 'Locate'

      expect(current_path).to eq('/search')
    end
  end

  it 'shows me the total results of stations that match my query' do
    VCR.use_cassette("views/search") do

      visit '/'

      fill_in :q, with: '80206'
      click_on 'Locate'

      expect(page).to have_content("Results 4")
    end
  end

  it 'shows me the total results of stations that match my query' do

      visit '/'

      VCR.use_cassette("views/search") do
      fill_in :q, with: '80206'
      click_on 'Locate'

      within '.stations' do
        expect(page).to have_content("Name: PUBLIC STATIONS")
        expect(page).to have_content("Address: 2951-2985 E 3rd Ave")
        expect(page).to have_content("Fuel Types: E")
        expect(page).to have_content("Distance: 0.62888")
        expect(page).to have_content("Access: 24 hours daily")
      end
    end
  end
end
#
# As a user
# When I visit "/"
# And I fill in the search form with 80206 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see the total results of the stations that match my query.
# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
