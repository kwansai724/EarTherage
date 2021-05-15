Rails.application.routes.draw do
  devise_for :students
  root 'static_pages#top'
end
