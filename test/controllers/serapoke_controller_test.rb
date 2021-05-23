require 'test_helper'

class SerapokeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get serapoke_index_url
    assert_response :success
  end

end
