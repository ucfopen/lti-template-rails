Rails.application.routes.draw do
  root 'application#index'

  # LTI XML CONFIG
  get :lti_config, controller: :application

  # LTI LAUNCH URL
  get :launch, controller: :application
  post :launch, controller: :application

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
