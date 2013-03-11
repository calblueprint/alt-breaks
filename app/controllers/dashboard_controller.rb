class DashboardController < ApplicationController
before_filter :require_login

def index
  #boolean to see if someone's a break leader
  is_break_leader = false

  #empty array stores trip permissions a user has member status in
  @all_user_member_trips = []
  @trip_permissions = current_user.trip_permissions
  @trip_permissions.each do |trip_permission|
    if trip_permission.permission == 1
      is_break_leader = true
      @trip_instance_of_break_leader = trip_permission.trip_instance
    elsif trip_permission.permission == 2
      @all_user_member_trips << trip_permission.trip_instance
    end
  end



  if is_break_leader
    break_leader(@trip_instance_of_break_leader)
  else
    regular_user
  end
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

end
