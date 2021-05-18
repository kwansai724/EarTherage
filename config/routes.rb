Rails.application.routes.draw do
  devise_for :staffs, :controllers => {
    :sessions => 'staffs/sessions'
  }
  devise_for :students, :controllers => {
    :sessions => 'students/sessions'
  }
  root 'static_pages#top'

  get 'therapist_training_course' => "therapist_training_course#index", as: :therapist_training_course#セラピスト養成コース画面
  get 'self_care_course' => "self_care_course#index", as: :self_care_course#セルフケアコース画面

  get 'admin_screen' => "admin_screen#index", as: :admin_screen#管理者画面
  get 'staffs_screen' => "staffs_screen#index", as: :staffs_screen#スタッフ画面

end
