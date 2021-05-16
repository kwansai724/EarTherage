Rails.application.routes.draw do
  devise_for :staffs, :controllers => {
    :sessions => 'staffs/sessions'
  }
  devise_for :students, :controllers => {
    :sessions => 'students/sessions'
  }
  root 'static_pages#top'

  get 'therapist_training_course' => "therapist_training_course#index", as: :therapist_training_course#セラピスト養成コース一覧

  get 'staffs_screen' => "staffs_screen#index", as: :staffs_screen#スタッフ画面

end
