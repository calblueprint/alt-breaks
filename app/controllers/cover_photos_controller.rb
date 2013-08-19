class CoverPhotosController < ApplicationController
  def update
    #need to do error checking
    cover_photo = CoverPhoto.find(params[:id])
    cover_photo.update_attributes(params[:cover_photo])

    head :ok
  end
end