class ApplicationController < ActionController::Base

  # studentにログイン後に遷移するpathを設定
  def student_after_sign_in_path_for(resource)
    therapist_training_course_path(resource)
  end

  # staffにログイン後に遷移するpathを設定
  def staff_after_sign_in_path_for(resource)
    staffs_screen_path(resource)
  end

  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    if resource_name == :student
      new_student_session_path
    elsif resource_name == :staff
      new_staff_session_path
    end
  end

end
