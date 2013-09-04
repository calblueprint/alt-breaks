class TripInstancesController < ApplicationController
  def show
    @is_trip = true
    @new_post = Post.new
    @testimony = Testimony.new
    @photo = Photo.new

    @instance_id = params[:id]
    @instance = TripInstance.find(params[:id])
    @trip = @instance.trip

    @posts = Kaminari.paginate_array(@instance.posts.sort_by!(&:created_at)).page(params[:page]).per(4)

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
    render "posts/index"
  end

  def create
    @trip_instance = TripInstance.new(params[:trip_instance])
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

  def display
    instance = TripInstance.find(params[:id])
    trip = instance.trip
    trip.update_attributes(:current_trip_instance => instance)
    redirect_to dashboard_url, notice: 'Displayed Trip was updated.'
  end

  def undisplay
    instance = TripInstance.find(params[:id])
    trip = instance.trip
    trip.update_attributes(:current_trip_instance => nil)
    redirect_to dashboard_url, notice: 'Displayed Trip was updated.'
  end

  def add_partner
    partner = Partner.find(params[:trip_instance][:partner_id])
    instance = TripInstance.find(params[:id])
    instance.partners << partner
    instance.save
    redirect_to dashboard_url, notice: 'Partner added to Trip Group.'
  end

  def remove_partner
    partner = Partner.find(params[:partner_id])
    instance = TripInstance.find(params[:id])
    instance.partners.delete(partner)
    instance.save
    redirect_to dashboard_url, notice: 'Partner added to Trip Group.'
  end
end
