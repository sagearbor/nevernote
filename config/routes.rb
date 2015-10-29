Rails.application.routes.draw do
  resources :notes
  resources :users, only: :create
  get 'sign_up' => 'users#new'
  root 'notes#new'
end
