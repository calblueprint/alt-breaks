class TestimoniesController < ApplicationController
  # GET /testimonies
  # GET /testimonies.json
  def index
    @testimonies = Testimony.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testimonies }
    end
  end

  # GET /testimonies/1
  # GET /testimonies/1.json
  def show
    @testimony = Testimony.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testimony }
    end
  end

  # GET /testimonies/new
  # GET /testimonies/new.json
  def new
    @trip = Trip.find_by_id(params[:trip_id])
    @testimony = Testimony.new
    5.times {@testimony.photos.build}

    
  end

  # GET /testimonies/1/edit
  def edit
    @testimony = Testimony.find(params[:id])
    @trip_instance_id = params[:trip_instance_id] #new -MC 
    5.times {@testimony.photos.build}
  end

  # POST /testimonies
  # POST /testimonies.json
  def create
    @testimony = Testimony.new(params[:testimony])
    trip_instance_id = params[:testimony][:trip_instance_id]
    #@trip = Trip.find_by_id(params[:trip_id])
=begin
    @instance =  TripInstance.find_by_id(@trip.current_trip_instance_id)
    @testimony.user = current_user
    if @testimony.save
      @instance.testimonies << @testimony
    end
=end
    @testimony.save
    redirect_to trip_instance_path(trip_instance_id)
  end

  # PUT /testimonies/1
  # PUT /testimonies/1.json
  def update
    @testimony = Testimony.find(params[:id])

    respond_to do |format|
      if @testimony.update_attributes(params[:testimony])
        format.html { redirect_to @testimony, notice: 'Testimony was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonies/1
  # DELETE /testimonies/1.json
  def destroy
    @testimony = Testimony.find(params[:id])
    @testimony.destroy

    respond_to do |format|
      format.html { redirect_to testimonies_url }
      format.json { head :no_content }
    end
  end
end
