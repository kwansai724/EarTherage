module StudentsHelper

  def course_status(student)
    return "セラピスト養成コース" if student.course_type == "therapist_training"
    return "セルフケアコース" if student.course_type == "self_care"
  end
end
