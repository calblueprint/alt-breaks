class TripPermissionsController < ApplicationController
before_filter :require_login

	def create
	  user_id = params[:trip_permission][:user_id]
	  trip_instance_id = params[:trip_permission][:trip_instance_id]
  	TripPermission.create(:user => user = User.find(user_id), :permission => 1, :trip_instance_id => trip_instance_id)
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Break Leader(s) successfully created.' }
    end
  end

  def destroy
    permission = TripPermission.find(params[:id])
    permission.destroy
    redirect_to dashboard_url, notice: 'Break Leader was removed'
  end

end