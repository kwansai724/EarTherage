class StudentsController < ApplicationController
  # オブジェクトの準備
  before_action :set_student, only: [:show, :update, :destroy]
  # アクセス制限
  before_action :admin_only, only: [:index, :show, :update, :destroy]

  def index
    @students = Student.paginate(page: params[:page], per_page: 10)
  end

  # def show
  #   @students = Student.paginate(page: params[:page], per_page: 10)
  # end

  def update
    if @student.update_attributes(student_params)
      flash[:success] = "受講生情報を更新しました。"
      redirect_to @student
    else
      render :template=> "admins/student_edit", :locals=> { :@student=> @student }
   end
  end

  def destroy
    @student.destroy
    flash[:success] = "「#{@student.name}」のデータを削除しました。"
    redirect_to students_url
  end

  def import
    if params[:file].blank?
      flash[:danger] = "csvデータが選択されていません。"
      redirect_to students_url
    else
      #fileはtmpに自動で一時保存される
      Student.import(params[:file])
      flash[:success] = "CSVデータをインポートしました。"
      redirect_to students_url
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end


    def student_params
      params.require(:student).permit(:name, :email, :course_type, :phone_nubmer)
    end

end
