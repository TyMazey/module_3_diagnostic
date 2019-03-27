class SearchFacade

  def initialize(search_params)
    @api_results = NRELService.new(search_params)
  end


  def stations
    @stations ||= @api_results.map do |station_info|
      Station.new(station_info)
    end
  end

  def result_count
    @stations.count
  end
end
