require 'test_helper'

class DiplomaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diploma_index_url
    assert_response :success
  end

end
