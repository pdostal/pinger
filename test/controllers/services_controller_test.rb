require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, service: { address: @service.address, name: @service.name, port: @service.port }
    end

    assert_redirected_to services_path
  end

  test "should update service" do
    patch :update, id: @service, service: { address: @service.address, name: @service.name, port: @service.port }
    assert_redirected_to services_path
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
