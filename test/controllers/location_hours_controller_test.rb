require 'test_helper'

class LocationHoursControllerTest < ActionController::TestCase
  setup do
    @location_hour = location_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_hour" do
    assert_difference('LocationHour.count') do
      post :create, location_hour: { name: @location_hour.name }
    end

    assert_redirected_to location_hour_path(assigns(:location_hour))
  end

  test "should show location_hour" do
    get :show, id: @location_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_hour
    assert_response :success
  end

  test "should update location_hour" do
    patch :update, id: @location_hour, location_hour: { name: @location_hour.name }
    assert_redirected_to location_hour_path(assigns(:location_hour))
  end

  test "should destroy location_hour" do
    assert_difference('LocationHour.count', -1) do
      delete :destroy, id: @location_hour
    end

    assert_redirected_to location_hours_path
  end
end
