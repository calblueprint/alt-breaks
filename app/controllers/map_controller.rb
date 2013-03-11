class MapController < ApplicationController
  def index
    # @message = "hiiiii"
    @json = Trip.find(2).to_gmaps4rails
  end
end
