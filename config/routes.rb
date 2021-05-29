Rails.application.routes.draw do
  devise_for :staffs, :controllers => {
    :sessions => 'staffs/sessions'
  }
  devise_for :students, :controllers => {
    :sessions => 'students/sessions'
  }
  root 'static_pages#top'

  get 'therapist_training_course' => 'therapist_training_course#index', as: :therapist_training_course#セラピスト養成コース画面トップページ
  get 'self_care_course' => "self_care_course#index", as: :self_care_course#セルフケアコース画面トップページ
  get 'therapist_training_course/:id' => 'therapist_training_course#show', as: :therapist_training_course_show#セラピスト養成コース マイページ
  get 'self_care_course/id' => 'self_care_course#show', as: :self_care_course_show#セルフケアコース マイページ

  get 'admin_screen' => 'admin_screen#index', as: :admin_screen#管理者画面
  get 'staffs_screen' => 'staffs_screen#index', as: :staffs_screen#スタッフ画面

  resources :staff do
    resources :blogs #スタッフブログ
  end

  #resources :start_schedules#開講スケジュール

  resources :schedules#開講スケジュール↲

  resources :students#ユーザー管理

  get 'serapoke' => 'serapoke#index', as: :serapoke#せらポケ

  get 'diploma' => 'diploma#index', as: :diploma#ディプロマ

  get '/admin/:student_id/student_edit' => 'admins#student_edit', as: :student_edit_admin#student編集

  post '/students/import' => 'students#import', as: :import_students#csvファイル取り込み

end
