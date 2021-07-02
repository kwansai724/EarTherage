class Staffs::SessionsController < Devise::SessionsController

  def create
    #元の認証ロジック
    #self.resource = warden.authenticate!(auth_options)

    #emailだけでログインできるように変更
    
    if params[:staff]['email'].present?
      self.resource = Staff.where(:email => params[:staff]['email']).first
      if self.resource.present?
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        if self.resource.admin == false
          session[:student_id] = "false"
          respond_with resource, :location => staff_after_sign_in_path_for(resource)
        elsif self.resource.admin == true
          session[:student_id] = "true"
          respond_with resource, :location => admin_after_sign_in_path_for(resource)
        end
      else
        flash[:danger] = "Eメールが違います"
        redirect_to new_staff_session_path
      end
    else
      flash[:danger] = "Eメールを入力してください"
      redirect_to new_staff_session_path
    end
  end

end
