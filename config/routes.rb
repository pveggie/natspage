Rails.application.routes.draw do

  # ActiveAdmin has everything
  ActiveAdmin.routes(self)
  # Login is only for admin features
  devise_for :users

  #Normal users can see photos, see the contact page, and see the about page
  root 'photos#index'
  resources :photos, only: [:index, :new, :create, :edit, :update, :destroy]
end
