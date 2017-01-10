require 'test_helper'

class LaunchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get launch_index_url
    assert_response :success
  end

end
