Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get 'static_pages/map'

  root 'static_pages#home'
end
