class AdminPermissionsController < ApplicationController
	def create
		user_id = params[:admin_permission][:user_id]
		if not AdminPermission.where("user_id = ?", user_id).exists?  
  			AdminPermission.create(:user => User.find(user_id))
  		end

	    respond_to do |format|
	      format.html { redirect_to dashboard_url, notice: 'Administrator(s) successfully created.' }
		end
	end

	def delete_admin
		admin_id = params[:admin_id]
	    admin = AdminPermission.find_by_id(admin_id)
	    if not admin == nil
	    	AdminPermission.destroy(admin_id)
	    end
	    respond_to do |format|
	    	format.html { redirect_to dashboard_url, notice: 'Administrator successfully deleted.' }
	    end
  	end
end
