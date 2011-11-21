class SearchController < ApplicationController

  def index
    unless params[:search].blank?
      @results = Sensis.search(:query => params[:search], :location => "sydney")
      @ratings = {}
      if @results
        @results.results.each do |r|
          puts r.id
          rating = Rating.find_by_sensis_id(r["id"]) || Rating.new(:sensis_id => r["id"])
          @ratings[r["id"]] = rating
        end
      end
    end
  end
  
end
