Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :posts
end
