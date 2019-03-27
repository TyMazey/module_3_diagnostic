class SearchController < ApplicationController

  def index
    render locals: {facade: SearchFacade.new(search_params)}
  end


  private

  def search_params
    params.permit(:q)
  end
end
