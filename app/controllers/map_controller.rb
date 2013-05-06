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

        Trip.all.each do |trip|
            if trip.trip_instances.any?
                puts trip.name
            end
        end

    	# again, preventative measures
    	if !trip.current_trip_instance then
            puts "ERROR, trip does not have trip instances. Attempting to skip."
    		next
            puts "Skipping did not work! FAIL"
    	end

    	###
    	# comment out for new breakleader code:
    	@leaders = trip.current_trip_instance.trip_permissions.where(:permission => 1).map {|permission| permission.user}
#    	puts "HELOO"
#    	puts @leaders
#    	puts "FUCCCKKK"
#    	puts @leaders.slice(0, @leaders.length-1)
#    	puts "HELLOOOO"

    	###
 #   	print "the length of the leaders are:" + @leaders.length.to_s
 #   	print "current instance id is:" + trip.current_trip_instance.to_s

    	# render teh html that will be requested when the marker is clicked on
    	# return teh json
    	marker.json(:id => trip.id)
    end
  end
end
