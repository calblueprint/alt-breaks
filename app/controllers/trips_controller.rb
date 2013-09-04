class TripsController < ApplicationController
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html
      format.json { render json: @trips }
    end
  end

  def show
    @new_post = Post.new
    @trip = Trip.find(params[:id])
    @testimonies = []
    @photos = []
    @trip.trip_instances.to_a.each do |instance|
      instance.testimonies.to_a.each do |t|
        @testimonies << t
      end
      instance.photos.to_a.each do |p|
        @photos << p
      end
    end

    @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(18)

    respond_to do |format|
      format.html
      format.json { render json: @trip }
    end
  end

  def new
    @trip = Trip.new

    respond_to do |format|
      format.html
      format.json { render json: @trip }
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(params[:trip])
    @trip.latitude = Float(@trip.latitude)
    @trip.longitude = Float(@trip.longitude)

    respond_to do |format|
      if @trip.save!
        format.html { redirect_to dashboard_url, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to dashboard_url, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
