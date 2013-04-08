class TripPermissionsController < ApplicationController
before_filter :require_login

	def create
	  user_id = params[:trip_permission][:user_id]
	  trip_instance_id = params[:trip_permission][:trip_instance_id]
#	  user_ids.each do |user_id|  	  
  	TripPermission.create(:user => user = User.find(user_id), :permission => 1, :trip_instance_id => trip_instance_id)
#  	end

=begin
		respond_to do |format|
		  	if @trip_permission.save
		    	format.html { redirect_to dashboard_url, notice: 'Break Leader was successfully created.' }
		    	format.json { render json: @trip_permission, status: :created, location: @trip_permission }
		  	else
		    	format.html { render action: "new" }
		   		format.json { render json: @trip_permission.errors, status: :unprocessable_entity }
		  	end
		end
	end
=end
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Break Leader(s) successfully created.' }
    end
  end
end