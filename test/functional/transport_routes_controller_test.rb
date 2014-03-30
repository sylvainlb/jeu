require 'test_helper'

class TransportRoutesControllerTest < ActionController::TestCase
  setup do
    @transport_route = transport_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_route" do
    assert_difference('TransportRoute.count') do
      post :create, transport_route: { arrival: @transport_route.arrival, quantity: @transport_route.quantity, start: @transport_route.start }
    end

    assert_redirected_to transport_route_path(assigns(:transport_route))
  end

  test "should show transport_route" do
    get :show, id: @transport_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_route
    assert_response :success
  end

  test "should update transport_route" do
    put :update, id: @transport_route, transport_route: { arrival: @transport_route.arrival, quantity: @transport_route.quantity, start: @transport_route.start }
    assert_redirected_to transport_route_path(assigns(:transport_route))
  end

  test "should destroy transport_route" do
    assert_difference('TransportRoute.count', -1) do
      delete :destroy, id: @transport_route
    end

    assert_redirected_to transport_routes_path
  end
end
