require 'test_helper'

class StartSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get start_schedules_index_url
    assert_response :success
  end

end
