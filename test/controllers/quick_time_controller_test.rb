require "test_helper"

class QuickTimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quick_time_index_url
    assert_response :success
  end
end
