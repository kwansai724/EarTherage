Rails.application.routes.draw do
  devise_for :students, :controllers => {
    :sessions => 'students/sessions'
  }
  root 'static_pages#top'
end
