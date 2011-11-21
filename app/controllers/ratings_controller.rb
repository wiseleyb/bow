class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.json
  def new
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    if params[:rating_id]
      @rating = Rating.find_by_id(params[:rating_id])
    end
    @rating ||= Rating.new
    @rating.sensis_id = params[:sensis_id]
    @rating.number_of_ratings ||= 0
    @rating.number_of_ratings += 1
    @rating.rating ||= 0
    @rating.rating += params[:rating].to_i
    @rating.save!
    redirect_to "/?search=#{params[:search_term]}" and return
  end

  # PUT /ratings/1
  # PUT /ratings/1.json
  def update
    @rating = Rating.find(params[:rating_id])
    @rating.sensis_id = params[:sensis_id]
    @rating.number_of_ratings ||= 0
    @rating.number_of_ratings += 1
    @rating.rating ||= 0
    @rating.rating += params[:rating].to_i
    @rating.save!
    redirect_to "/?search=#{params[:search_term]}" and return
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :ok }
    end
  end
end
