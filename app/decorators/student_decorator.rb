# frozen_string_literal: true

module StudentDecorator

  # コース名の表示条件分けと日本語化
  def course_name
    return "セラピスト養成コース" if self.course_type == "therapist_training"
    return "セルフケアコース" if self.course_type == "self_care"
  end
  
end
