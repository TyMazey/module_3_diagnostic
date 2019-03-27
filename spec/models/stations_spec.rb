require 'rails_helper'

describe 'Station' do

  it 'exist' do
    info = {"name" => "name", "address" => "123", "fuel_types" => "E", "distance" => "100", "access_times" => "10"}

    station = Station.new(info)

    expect(station).to be_a(Station)
  end

  it 'has attributes' do
    info = {"name" => "name", "address" => "123", "fuel_types" => "E", "distance" => "100", "access_times" => "10"}
    station = Station.new(info)

    expect(station.name).to eq("name")
    expect(station.address).to eq("123")
    expect(station.fuel_types).to eq("E")
    expect(station.distance).to eq("100")
    expect(station.access_times).to eq("10")
  end
end
