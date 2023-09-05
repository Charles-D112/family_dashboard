require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get trophee" do
    get lists_trophee_url
    assert_response :success
  end
end
