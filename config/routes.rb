Rails.application.routes.draw do

  # ActiveAdmin has everything
  ActiveAdmin.routes(self)

  # Login is only for admin features
  devise_for :users
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
  end

  # Normal users can see photos, see the contact page, and see the about page
  # Admin users can also create, update and delete photos and contact/about
  # page info
  root 'photos#index'
  resources :photos, except: [:show]

  get 'pages/about' => 'pages#about'
  namespace :pages do
    resources :about_sections
  end
end
