class AdminsController < ApplicationController
  # オブジェクトの準備
  before_action :set_student, only: [:student_edit]
  # アクセス制限↲
  before_action :admin_only, only: [:student_edit]

  def student_edit
  end

  private

    def set_student
      @student = Student.find(params[:student_id])
    end

end
