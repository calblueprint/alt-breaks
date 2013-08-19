class PagesController < ApplicationController
  def index
    @pages = Page.all

    respond_to do |format|
      format.html
      format.json { render json: @pages }
    end
  end


  def show
    @is_page = true
    @new_post = Post.new
    @page = Page.find(params[:id])
    @posts = @posts = Kaminari.paginate_array(@page.posts.sort_by!(&:created_at)).page(params[:page]).per(4)
    temp_users = User.all
    @users = []
    if User.all.length > 6
      temp_users.shuffle[0...6].each do |user|
        @users << user
      end
    else
      @users = temp_users
    end

    render "posts/index"
  end

  def new
    @page = Page.new

    respond_to do |format|
      format.html
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
