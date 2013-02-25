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
    @testimony = Testimony.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testimony }
    end
  end

  # GET /testimonies/1/edit
  def edit
    @testimony = Testimony.find(params[:id])
  end

  # POST /testimonies
  # POST /testimonies.json
  def create
    @testimony = Testimony.new(params[:testimony])

    respond_to do |format|
      if @testimony.save
        format.html { redirect_to @testimony, notice: 'Testimony was successfully created.' }
        format.json { render json: @testimony, status: :created, location: @testimony }
      else
        format.html { render action: "new" }
        format.json { render json: @testimony.errors, status: :unprocessable_entity }
      end
    end
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
