class MapController < ApplicationController
  def index
    # the gmap function in teh view expects json so we have to render it
    # until all teh trips have dummy current_trip_instance_ids, we will only do Where the Wild Things Are
    @json = Trip.all.to_gmaps4rails do |trip, marker|
    	###
    	# comment in for new breakleader code:
    	# leaders = trip.break_leader_permissions.map do |permission|
    	# 	permission.user
    	# end
    	###

    	# again, preventative measures
    	if trip.current_trip_instance_id == nil then
    		next
    	end

    	###
    	# comment out for new breakleader code:
    	leaders = TripInstance.find(trip.current_trip_instance_id).trip_permissions.where(permission=1).map do |permission|
    		permission.user
    	end
    	###

    	# render teh html that will be requested when the marker is clicked on
    	marker.infowindow render_to_string :partial => "map/popup", :locals => {:trip => trip, :leaders => leaders}
    	# return teh json
    	marker.json({:id => trip.id})
    end
  end
end
