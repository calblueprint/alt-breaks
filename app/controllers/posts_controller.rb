class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    #Must compiled posts regarding trip
    trip_instance_id = params[:trip_instance_id]
    @new_post = Post.new  #set up for modal
    @testimony = Testimony.new  #set up for modal
    5.times {@testimony.photos.build}
    
    if (trip_instance_id = params[:post][:trip_instance_id]) != nil

    @instance = TripInstance.find_by_id(trip_instance_id)
    @instance_id = @instance.id
    @posts = @instance.posts
    @posts.sort_by!(&:updated_at)
    @posts.reverse!

    #sidebar stuff will be hardcoded in because of some weird shit
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
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(@instance_id)
 
    @post = Post.find(params[:id])
    @response = Response.new
    @responses = Response.all

    @new_post = Post.new  #set up for modal
    @testimony = Testimony.new  #set up for modal
    5.times {@testimony.photos.build}
    

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
    
    if (trip_instance_id = params[:post][:trip_instance_id]) != nil
      @instance = TripInstance.find_by_id(trip_instance_id)
      if @post.save
        @instance.posts << @post
      end
      redirect_to trip_instance_path(@instance)
    elsif (page_id = params[:post][:page_id]) != nil
      puts 'creating page post'
      puts page_id
      
      @page = Page.find_by_id(page_id)
      if @post.save
        @page.posts << @post
      end
      redirect_to page_path(@page)
    end
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
