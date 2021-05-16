class ApplicationController < ActionController::Base
  def student_after_sign_in_path_for(resource)
    therapist_training_course_path(resource)
  end

  def staff_after_sign_in_path_for(resource)
    staffs_screen_path(resource)
  end

end
