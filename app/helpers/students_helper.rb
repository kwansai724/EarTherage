module StudentsHelper

  #navbar右端のアイコンからマイページ選択時のルーティング
  def mypage_rotes(student)
    return therapist_training_course_show_path(current_student) if student.course_type == "therapist_training"
    return self_care_course_show_path(current_student) if student.course_type == "self_care"
  end
end
