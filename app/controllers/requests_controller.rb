class RequestsController < ApplicationController

before_filter :require_login

def index
  @trips = Trip.all
  @trip_instances = []
  @trips.each do |trip|
    current_trip_id = trip.current_trip_instance_id
    temp_trip_instance = TripInstance.find_by_id(current_trip_id)
    @trip_instances << temp_trip_instance
  end
  @trip_instances_without_current_user = []
  @trip_instances.each do |tinstance|
      boolean = false
      tinstance.trip_permissions.each do |tperm|
        if tperm.user == current_user
          boolean = true
        end
      end
      if !boolean
        @trip_instances_without_current_user << tinstance
      end
  end
  @trip_instances_current_user_has_already_requested = []
  @trip_instances_without_a_request_from_current_user =  []
  @trip_instances_without_current_user.each do |tinstance|
    boolean = false
    tinstance.requests.each do |request|
      if request.user == current_user
        boolean = true
        @trip_instances_current_user_has_already_requested << tinstance
      end
    end
    if !boolean
      @trip_instances_without_a_request_from_current_user << tinstance
    end
  end
end

def create
  incoming_data = params[:requests]
  incoming_data.each do |key, idata|
    if idata == "1"
      a = Trip.find_by_name(key)
      req = Request.new
      req.user = current_user
      req.trip_instance = TripInstance.find_by_id(a.current_trip_instance_id)
      req.save
    end
  end
  redirect_to dashboard_path
end

def destroy
  incoming_trip_instance_id = params[:id]
  tinstance = TripInstance.find_by_id(incoming_trip_instance_id)
  to_delete = []
  tinstance.requests.each do |req|
    if req.user == current_user
      to_delete = req
    end
  end
  req = to_delete
  if !req.nil?
    req.delete
    req.save
  end
  redirect_to dashboard_path
end

def approve
#need to make the requests belong to me
id = params[:id]
req = Request.find_by_id(id)
trip_instance = req.trip_instance
is_legal = false
trip_instance.trip_permissions.each do |tper|
    if tper.user == current_user and tper.permission = 1
      is_legal = true
    end
end
if is_legal
  trip_permission = TripPermission.new
  trip_permission.user = req.user
  trip_permission.permission = 2
  trip_permission.trip_instance = trip_instance
  trip_permission.save
  req.delete
end
redirect_to dashboard_path
end

end
