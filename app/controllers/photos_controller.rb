class PhotosController < ApplicationController
  def create
    #need to do error checking
    @photo = Photo.create!(params[:photo])
    trip_instance_id = params[:photo][:trip_instance_id]

    redirect_to trip_instance_path(trip_instance_id)
  end
end