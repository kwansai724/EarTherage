module StaffsHelper

    # 管理者・スタッフログイン時のパスの切り分け
    def staff_toppage_routes(staff)
      return admin_screen_path if staff.admin == true
      return staffs_screen_path if staff.admin == false
    end
  
end
