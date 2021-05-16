class Students::SessionsController < Devise::SessionsController

  def create
    #元の認証ロジック
    #self.resource = warden.authenticate!(auth_options)

    #emailだけでログインできるように変更
    
    if params[:student]['email'].present?
      self.resource = Student.where(:email => params[:student]['email']).first
      if self.resource.present?
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, :location => student_after_sign_in_path_for(resource)
      else
        flash[:danger] = "Eメールが違います"
        redirect_to new_student_session_path
      end
    else
      flash[:danger] = "Eメールを入力してください"
      redirect_to new_student_session_path
    end
  end

end
