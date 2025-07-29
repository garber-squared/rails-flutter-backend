Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :posts

  # config/routes.rb
  post 'signup', to: 'auth#signup'
  post 'login', to: 'auth#login'
  delete 'logout', to: 'auth#logout'  # optional; token-based logout is usually handled client-side
end
