class TestimoniesController < ApplicationController
  def index
    @testimonies = Testimony.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testimonies }
    end
  end

  def show
    @testimony = Testimony.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @testimony }
    end
  end

  def new
    @trip = Trip.find_by_id(params[:trip_id])
    @testimony = Testimony.new
  end

  def edit
    @testimony = Testimony.find(params[:id])
    @trip_instance_id = params[:trip_instance_id]
    5.times {@testimony.photos.build}
  end

  def create
    #need to do error checking
    @testimony = Testimony.create!(params[:testimony])
    trip_instance_id = params[:testimony][:trip_instance_id]

    redirect_to trip_instance_path(trip_instance_id)
  end

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

  def destroy
    @testimony = Testimony.find(params[:id])
    @testimony.destroy

    respond_to do |format|
      format.html { redirect_to testimonies_url }
      format.json { head :no_content }
    end
  end
end
