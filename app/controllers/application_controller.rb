class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # スタッフ新規登録時に名前も登録できるように設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  # セラピスト養成コースの受講生がログイン後に遷移するpathを設定
  def therapist_training_course_student_after_sign_in_path_for(resource)
    therapist_training_course_path(resource)
  end

  # セルフケアコースの受講生がログイン後に遷移するpathを設定
  def self_care_course_student_after_sign_in_path_for(resource)
   self_care_course_path(resource)
  end

  # staffにログイン後に遷移するpathを設定
  def staff_after_sign_in_path_for(resource)
    staffs_screen_path(resource)
  end

  # 管理者にログイン後に遷移するpathを設定
  def admin_after_sign_in_path_for(resource)
    admin_screen_path(resource)
  end

  # スタッフ新規登録後に遷移するpathを設定
  def staff_after_sign_up_path_for(resource)
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

  # paramsハッシュからスケジュールを取得します。
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
  def set_students
    @student = current_student
  end  
  private

    def admin_only
      unless current_staff.present? && current_staff.admin == true
        flash[:danger] = "管理者しか受講生管理は出来ません。"
        redirect_to root_path
      end
    end

end
