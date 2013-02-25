require 'test_helper'

class TestimoniesControllerTest < ActionController::TestCase
  setup do
    @testimony = testimonies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testimonies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testimony" do
    assert_difference('Testimony.count') do
      post :create, testimony: { context: @testimony.context, trip_instance_id: @testimony.trip_instance_id, user_id: @testimony.user_id }
    end

    assert_redirected_to testimony_path(assigns(:testimony))
  end

  test "should show testimony" do
    get :show, id: @testimony
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testimony
    assert_response :success
  end

  test "should update testimony" do
    put :update, id: @testimony, testimony: { context: @testimony.context, trip_instance_id: @testimony.trip_instance_id, user_id: @testimony.user_id }
    assert_redirected_to testimony_path(assigns(:testimony))
  end

  test "should destroy testimony" do
    assert_difference('Testimony.count', -1) do
      delete :destroy, id: @testimony
    end

    assert_redirected_to testimonies_path
  end
end
