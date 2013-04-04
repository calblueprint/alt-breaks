require 'pp'

class TripInstancesController < ApplicationController
  # GET /trips_instances/1
  # GET /trips_instances/1.json
  def show
    @instance = TripInstance.find(params[:id])
    @trip = @instance.trip
    @temp_posts = @instance.posts
    @posts = []
    temp_users = []
    trip_permissions = @instance.trip_permissions
    trip_permissions.shuffle.each do |tper|
      if tper.permission == 1 || tper.permission == 2
        temp_users << tper.user
      end
    end
    if @temp_posts.length > 3
      @temp_posts[0...3].each do |post|
          @posts << post
      end
    else
      @posts = @temp_posts
    end
    @users = []
    if temp_users.length > 4
      temp_users[0...4].each do |user|
        @users << user
      end
    else
      @users = temp_users
    end

        
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
