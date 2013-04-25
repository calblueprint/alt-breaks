class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
    @response = Response.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(params[:response])
    post = Post.find(params[:response][:post_id])

    respond_to do |format|
      if @response.save
        if post.trip_instance != nil
          format.html { redirect_to "/trip_instances/#{post.trip_instance_id}/posts/#{post.id}", notice: 'Response was successfully created.' }
        elsif post.page != nil
           format.html { redirect_to "/pages/#{post.page_id}/posts/#{post.id}", notice: 'Response was successfully created.' }
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    post = @response.post
    @response.destroy

    respond_to do |format|
      format.html { redirect_to "/trip_instances/#{post.trip_instance_id}/posts/#{post.id}" }
      format.json { head :no_content }
    end
  end
end
