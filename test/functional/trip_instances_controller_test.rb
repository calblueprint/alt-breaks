require 'test_helper'

class TripInstancesControllerTest < ActionController::TestCase
  setup do
    @trip_instance = trip_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_instance" do
    assert_difference('TripInstance.count') do
      post :create, trip_instance: { description: @trip_instance.description, year: @trip_instance.year }
    end

    assert_redirected_to trip_instance_path(assigns(:trip_instance))
  end

  test "should show trip_instance" do
    get :show, id: @trip_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_instance
    assert_response :success
  end

  test "should update trip_instance" do
    put :update, id: @trip_instance, trip_instance: { description: @trip_instance.description, year: @trip_instance.year }
    assert_redirected_to trip_instance_path(assigns(:trip_instance))
  end

  test "should destroy trip_instance" do
    assert_difference('TripInstance.count', -1) do
      delete :destroy, id: @trip_instance
    end

    assert_redirected_to trip_instances_path
  end
end
