class AdminPermissionsController < ApplicationController
	def create
		user_id = params[:admin_permission][:user_id]
		if not AdminPermission.where("user_id = ?", user_id).exists?
  			AdminPermission.create(params[:admin_permission])
  		end

	    respond_to do |format|
	      format.html { redirect_to dashboard_url, notice: 'Administrator(s) successfully created.' }
		end
	end

	def update
	  @permission = AdminPermission.find params[:id]

	  respond_to do |format|
	    if @permission.update_attributes(params[:admin_permission])
	      format.html { redirect_to(dashboard_path, :notice => 'User was successfully updated.') }
	      format.json { respond_with_bip(@permission) }
	    else
	      format.html { render :action => "edit" }
	      format.json { respond_with_bip(@permission) }
	    end
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
