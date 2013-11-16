require 'test_helper'

class ListedRestaurantsControllerTest < ActionController::TestCase
  setup do
    @listed_restaurant = listed_restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listed_restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listed_restaurant" do
    assert_difference('ListedRestaurant.count') do
      post :create, listed_restaurant: {  }
    end

    assert_redirected_to listed_restaurant_path(assigns(:listed_restaurant))
  end

  test "should show listed_restaurant" do
    get :show, id: @listed_restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listed_restaurant
    assert_response :success
  end

  test "should update listed_restaurant" do
    patch :update, id: @listed_restaurant, listed_restaurant: {  }
    assert_redirected_to listed_restaurant_path(assigns(:listed_restaurant))
  end

  test "should destroy listed_restaurant" do
    assert_difference('ListedRestaurant.count', -1) do
      delete :destroy, id: @listed_restaurant
    end

    assert_redirected_to listed_restaurants_path
  end
end
