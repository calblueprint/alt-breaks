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

  def create
    @trip_instance = TripInstance.new(params[:trip_instance])

    respond_to do |format|
      if @trip_instance.save
        format.html { redirect_to dashboard_url, notice: 'Trip Instance was successfully created.' }
        format.json { render json: @trip_instance, status: :created, location: @trip_instance }
      else
        format.html { render action: "new" }
        format.json { render json: @trip_instance.errors, status: :unprocessable_entity }
      end
    end
  end
end
