class SearchFacade

  def initialize(search_params)
    @api_results = NRELService.new(search_params).get_stations
  end


  def stations
    @stations ||= @api_results["fuel_stations"].map do |station_info|
      Station.new(station_info)
    end
  end

  def result_count
    @api_results["total_results"]
  end
end
