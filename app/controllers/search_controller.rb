class SearchController < ApplicationController

  def index
    if params[:search]
      @results = Sensis.search(:query => params[:search], :location => "sydney")
    end
  end
  
end
