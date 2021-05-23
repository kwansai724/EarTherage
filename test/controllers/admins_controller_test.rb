require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get student_edit" do
    get admins_student_edit_url
    assert_response :success
  end

end
