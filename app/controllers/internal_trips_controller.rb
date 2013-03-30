require 'pp'

class InternalTripsController < ApplicationController
  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @posts = @trip.posts
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end
end
