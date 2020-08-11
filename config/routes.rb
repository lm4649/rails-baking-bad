Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to:'users#dashboard'
  resources :bakeries, only: [:index, :show, :new, :create ]
  resources :breads, only: [:new, :create] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:update]

end
