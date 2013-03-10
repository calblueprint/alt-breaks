require 'pp'

class TripInstancesController < ApplicationController
  # GET /trips_instances/1
  # GET /trips_instances/1.json
  def show
    @instance = TripInstance.find(params[:id])
    @trip = @instance.trip
    @posts = @instance.posts
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instance }
    end
  end
end
