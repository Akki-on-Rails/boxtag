Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#search'
  get 'basic-qr-code-reader', to: 'basic_qr_codes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_collections, only: :destroy
  resources :boxes, except: [:new, :create] do
    resources :items, only: [:new, :create]
    resource :qrcode, only: [:show]
  end
  resources :items, except: [:new, :create]
  resources :collections do
    resources :user_collections, only: [:new, :create]
    resources :boxes, only: [:new, :create]
  end
end
