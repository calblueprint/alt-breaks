class AdminPermissionsController < ApplicationController
	def create
		user_id = params[:admin_permission][:user_id]	  
  		AdminPermission.create(:user => User.find(user_id))

	    respond_to do |format|
	      format.html { redirect_to dashboard_url, notice: 'Administrator(s) successfully created.' }
		end
	end
end
