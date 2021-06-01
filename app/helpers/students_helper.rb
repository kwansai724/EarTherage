module StudentsHelper

  # 受講生ログイン時のnavbar左端のロゴクリック時のパス
  def student_toppage_routes(student)
    return therapist_training_course_path(current_student) if student.course_type == "therapist_training"
    return self_care_course_path(current_student) if student.course_type == "self_care"
  end

  #navbar右端のアイコンからマイページ選択時のパス
  def mypage_routes(student)
    return therapist_training_course_show_path(current_student) if student.course_type == "therapist_training"
    return self_care_course_show_path(current_student) if student.course_type == "self_care"
  end

end
