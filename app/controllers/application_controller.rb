class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    therapist_training_course_path(resource)
end
end
