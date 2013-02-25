class TripInstancesController < ApplicationController
  # GET /trip_instances
  # GET /trip_instances.json
  def index
    @trip_instances = TripInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trip_instances }
    end
  end

  # GET /trip_instances/1
  # GET /trip_instances/1.json
  def show
    @trip_instance = TripInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip_instance }
    end
  end

  # GET /trip_instances/new
  # GET /trip_instances/new.json
  def new
    @trip_instance = TripInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip_instance }
    end
  end

  # GET /trip_instances/1/edit
  def edit
    @trip_instance = TripInstance.find(params[:id])
  end

  # POST /trip_instances
  # POST /trip_instances.json
  def create
    @trip_instance = TripInstance.new(params[:trip_instance])

    respond_to do |format|
      if @trip_instance.save
        format.html { redirect_to @trip_instance, notice: 'Trip instance was successfully created.' }
        format.json { render json: @trip_instance, status: :created, location: @trip_instance }
      else
        format.html { render action: "new" }
        format.json { render json: @trip_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trip_instances/1
  # PUT /trip_instances/1.json
  def update
    @trip_instance = TripInstance.find(params[:id])

    respond_to do |format|
      if @trip_instance.update_attributes(params[:trip_instance])
        format.html { redirect_to @trip_instance, notice: 'Trip instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_instances/1
  # DELETE /trip_instances/1.json
  def destroy
    @trip_instance = TripInstance.find(params[:id])
    @trip_instance.destroy

    respond_to do |format|
      format.html { redirect_to trip_instances_url }
      format.json { head :no_content }
    end
  end
end
