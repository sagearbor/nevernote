Rails.application.routes.draw do
  resources :notes

  resources :users, only: :create
  get 'sign_up' => 'users#new'

  resources :sessions, only: :create
  get     'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  root 'notes#new'
end
