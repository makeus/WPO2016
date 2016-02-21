class PlacesController < ApplicationController
  def index
  end

  def show
    if session[:latestcity].nil?
        redirect_to places_path, notice: "No place saved for id #{oarams[:id]}"
    end

    @place = BeermappingApi.places_in(session[:latestcity]).select{|place|place.id = params[:id]}.first
    
    if @place.nil?
        redirect_to places_path, notice: "No place saved for id #{oarams[:id]}"
    end
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:latestcity] = params[:city]
      render :index
    end
  end
end