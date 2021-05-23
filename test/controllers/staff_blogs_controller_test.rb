require 'test_helper'

class StaffBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_blogs_index_url
    assert_response :success
  end

end
