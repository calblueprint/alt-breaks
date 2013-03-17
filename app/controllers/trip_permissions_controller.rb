class TripPermissionsController < ApplicationController
before_filter :require_login

	def create
		#@trip_permission = TripInstance.new(params[:trip_permission])
		first_name = params[:first_name]
		last_name = params[:last_name]
		trip_instance_id = params[:trip_instance_id]
		user = User.where("first_name = ? AND last_name = ?", first_name, last_name).first
		user_id = user.id
		@trip_permission = TripPermission.new(:user_id => user_id, :permission => 1, :trip_instance_id => trip_instance_id)

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
end