module StaffsHelper

    # 管理者・スタッフログイン時のnavbar左端のロゴクリック時のパス
    def staff_toppage_routes(staff)
      return admin_screen_path if staff.admin == true
      return staffs_screen_path if staff.admin == false
    end
  
end
