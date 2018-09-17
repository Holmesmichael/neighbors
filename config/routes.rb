Rails.application.routes.draw do
  resources :volunteers
  get 'messages/index'

  get 'conversations/index'

  devise_for :users
  get 'static_pages/home'
  get 'static_pages/map'

  root 'static_pages#home'

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  
  resources :requests do
    member { patch 'incr_done' }
  end


end
