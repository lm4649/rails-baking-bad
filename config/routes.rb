Rails.application.routes.draw do
  get 'breads/show'
  get 'breads/new'
  get 'breads/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
