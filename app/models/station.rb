class Station
  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(info)
    @name = info["name"]
    @address = info["address"]
    @fuel_types = info["fuel_types"]
    @distance = info["distance"]
    @access_times = info["access_times"]
  end
end
