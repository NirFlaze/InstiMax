require "test_helper"

class ExploreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)

    get explore_path
    assert_response :success
  end
end
