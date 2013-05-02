class DashboardController < ApplicationController

	def create
		user_id = params[:new_admin][:user_id]
		Admin_permission.create(:user => user = User.find(user_id))
		respond_to do |format|
      		format.html { redirect_to dashboard_url, notice: 'Admin(s) successfully created.' }
    	end
	end

end