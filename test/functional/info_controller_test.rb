require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

end
