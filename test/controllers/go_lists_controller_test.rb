require 'test_helper'

class GoListsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
