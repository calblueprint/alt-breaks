require 'pp'

class InternalTripsController < ApplicationController
  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @posts = []

    if trip_instances = @trip.trip_instances
      trip_instances.each do |instance| #loop through all trip instances
        @posts << instance.posts
      end
    end
    
    @posts.flatten!  # Makes it one array, vs. array of arrays
    
    puts "Posts: "
    pp @posts
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end
end
