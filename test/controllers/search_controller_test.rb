require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)

    get search_index_url
    assert_response :success
  end
end
