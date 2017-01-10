Rails.application.routes.draw do
  post 'launch/index'
  root 'launch#index'
  get 'xml', to: 'xml#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
