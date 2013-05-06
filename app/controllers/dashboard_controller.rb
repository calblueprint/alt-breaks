class DashboardController < ApplicationController
before_filter :require_login

def index
  #boolean to see if someone's a break leader
  is_break_leader = false
  is_admin = false

  #empty array stores trip permissions a user has member status in
  @all_user_member_trips = []

  if @admin_permission = current_user.admin_permission
    admin
    puts 'IS ADMIN!!'
  else
    @trip_permissions = current_user.trip_permissions
    @trip_permissions.each do |trip_permission|
      if trip_permission.permission == 1
        is_break_leader = true
        @trip_instance_of_break_leader = trip_permission.trip_instance
        @trip_name = @trip_instance_of_break_leader.trip.name
        @trip_year = @trip_instance_of_break_leader.year
      elsif trip_permission.permission == 2
        @all_user_member_trips << trip_permission.trip_instance
      end
    end

    if is_break_leader
      puts 'IS BREAK LEADER'
      break_leader(@trip_instance_of_break_leader)
    else
      puts 'IS REGULAR USER'
      regular_user
    end
  end
end

def admin
  @trip_instance = TripInstance.new
  @trip_permission = TripPermission.new
  @new_trip = Trip.new
  @community_partner = Partner.new
  @new_admin = AdminPermission.new
  render :action => :admin_dashboard
end

def break_leader(trip_instance_of_break_leader)
  @list_of_members = []
  @requests_for_break_leader = trip_instance_of_break_leader.requests
  trip_instance_of_break_leader.trip_permissions.each do |trip_permission|
    if trip_permission.permission == 2
      @list_of_members << trip_permission.user
    end
  end
  render :action => :break_leader
end

def regular_user
  render :action => :regular_user
end

def delete_from_trip
  #must enforce admin
  trip_instance_of_break_leader_id = params[:tripinstid]
  is_legal = false
  trip_instance = TripInstance.find_by_id(trip_instance_of_break_leader_id)
  trip_instance.trip_permissions.each do |tper|
    if tper.permission == 1 and tper.user == current_user
      is_legal = true
    end
  end

  if is_legal
    member_id = params[:id]
    user = User.find_by_id(member_id)
    user_permissions = user.trip_permissions
    due_to_delete = []
    user_permissions.each do |uperm|
      if uperm.trip_instance == trip_instance
        due_to_delete = uperm
      end
    end
    tper = TripPermission.find_by_id(due_to_delete.id)
    tper.delete
    tper.save
  end

  redirect_to dashboard_path
end

def change_current
  trip = Trip.find(params[:trip_id])
  trip.current_trip_instance = TripInstance.find(params[:new_current_inst_id])


  respond_to do |format|
    if trip.save
      format.html { redirect_to dashboard_url, notice: 'Displayed Trip was updated.' }
        format.json { render json: trip, status: :created, location: trip }
      else
        format.html { render action: "new" }
        format.json { render json: trip.errors, status: :unprocessable_entity }
      end
    end
  end

end

def delete_break_leader(permission_id)
  trip_permission = TripPermission.find(permission_id)
  trip_permission.permission = 0
  trip_permission.save

  redirect_to :back

end
