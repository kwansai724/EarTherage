require 'test_helper'

class TherapistTrainingCourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get therapist_training_course_index_url
    assert_response :success
  end

end
