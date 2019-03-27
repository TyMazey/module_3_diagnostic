class NRELService

  def initialize(search_params)
    @search_params = search_params
  end


  def get_stations
    @stations ||= parse_response(get_response(@search_params))
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_response(zip)
    conn.get do |req|
      req.params['status'] = 'E'
      req.params['access'] = 'public'
      req.params['fuel_type'] = 'ELEC,LPG'
      req.params['zip'] = zip
      req.params['limit'] = '15'
      req.params['location'] = zip
      req.params['api_key'] = ENV['NREL_API_KEY']
    end
  end

    def parse_response(response)
      JSON.parse(response.body)
    end
end
