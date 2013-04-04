class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    #Must compiled posts regarding trip
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @posts = @instance.posts
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @post = Post.find(params[:id])
    @response = Response.new
    @responses = Response.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
      format.json { render json: @responses }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @post = Post.new

    if params[:type] == 'trip'
      @trip_id = params[:trip_id]   #need to set param in routing from view where button is
    elsif params[:type] == 'instance'
      @trip_instance_id = params[:trip_instance_id] #need to set param in routing from view where button is
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)

    if @post.save
      @instance.posts << @post
    end
    redirect_to trip_instance_posts_path(@instance.id)
  end

  # GET /posts/1/edit
  def edit
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @post = Post.find(params[:id])
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @instance = TripInstance.find_by_id(params[:trip_instance_id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to trip_instance_path(@instance.id), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
