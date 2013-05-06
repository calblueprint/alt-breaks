require 'pp'

class TripInstancesController < ApplicationController
  # GET /trips_instances/1
  # GET /trips_instances/1.json
  def show
    @new_post = Post.new  #set up for modal
    @testimony = Testimony.new  #set up for modal
    5.times {@testimony.photos.build}

    @instance_id = params[:id]
    @instance = TripInstance.find(params[:id])
    @trip = @instance.trip

    @posts = Kaminari.paginate_array(@instance.posts.sort_by!(&:created_at)).page(params[:page]).per(4) #don't need below code b/c doing pagination

    #users to be displayed in sidebar
    temp_users = []
    trip_permissions = @instance.trip_permissions
    trip_permissions.shuffle.each do |tper|
      if tper.permission == 1 || tper.permission == 2
        temp_users << tper.user
      end
    end
    @users = []
    if temp_users.length > 6
      temp_users[0...6].each do |user|
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
    puts params[:trip_instance][:trip_id]
    trip = Trip.find(params[:trip_instance][:trip_id])

    if trip.current_trip_instance == nil
      trip.current_trip_instance = @trip_instance
    end

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
