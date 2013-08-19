class PostsController < ApplicationController
=begin
  # GET /posts
  # GET /posts.json
  def index
    #Must compiled posts regarding trip
    trip_instance_id = params[:trip_instance_id]
    @new_post = Post.new  #set up for modal
    @testimony = Testimony.new  #set up for modal
    5.times {@testimony.photos.build}

    @instance = TripInstance.find_by_id(trip_instance_id)
    @instance_id = @instance.id
    @posts = @instance.posts
    @posts.sort_by!(&:updated_at)
    @posts.reverse!

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
=end

=begin
  def pages_index
    #Must compiled posts regarding trip
    page_id = params[:page_id]
    @new_post = Post.new  #set up for modal
    @page = Page.find_by_id(page_id)
    @posts = @page.posts
    @posts.sort_by!(&:updated_at)
    @posts.reverse!

    temp_users = User.all
     @users = []
    if temp_users.length > 6
      temp_users[0...6].each do |user|
        @users << user
      end
    else
      @users = temp_users
    end
  end
=end


  def show
    @post = Post.find(params[:id])
    @responses = @post.responses
    @response = Response.new
    @new_post = Post.new
    @photo = Photo.new

    @instance_id = params[:trip_instance_id]
    @page_id = params[:page_id]

    #trip instance post
    if @instance_id
      @instance = TripInstance.find_by_id(@instance_id)
      @testimony = Testimony.new

      temp_users = []
      trip_permissions = @instance.trip_permissions
      trip_permissions.shuffle.each do |tper|
        if tper.permission == 1 || tper.permission == 2
          temp_users << tper.user
        end
      end
    #page post
    elsif (@page_id = params[:page_id]) != nil
      temp_users = User.all
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
      format.html
      format.json { render json: @post }
      format.json { render json: @responses }
    end
  end

  def new
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @post = Post.new

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def create
    # all mail currently also gets sent to the poster as well as everyone else
    @post = Post.new(params[:post])
    @post.user = current_user

    if (trip_instance_id = params[:post][:trip_instance_id]) != nil
      @instance = TripInstance.find_by_id(trip_instance_id)
      if @post.save
        @instance.posts << @post
        if current_user.is_break_leader(@instance)
          # send to all users in the break group
          recipients = User.break_group(@instance)
          UserMailer.post_created_email(recipients, @post).deliver
        end
      end
      redirect_to trip_instance_path(@instance)
    elsif (page_id = params[:post][:page_id]) != nil
      @page = Page.find_by_id(page_id)
      if @post.save
        @page.posts << @post
        # send mail
        if current_user.is_admin or current_user.is_break_leader
          if page_id == "1"
            # general, send mail to all users
            recipients = User.all
          elsif page_id == "2"
            # internal, send mail to all admins and break leaders
            recipients = User.admins + User.break_leaders
          end
          UserMailer.post_created_email(recipients, @post).deliver
        end
      end
      redirect_to page_path(@page)
    end
  end

  def edit
    trip_instance_id = params[:trip_instance_id]
    @instance = TripInstance.find_by_id(trip_instance_id)
    @post = Post.find(params[:id])
  end

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
