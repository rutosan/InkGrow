Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get '', to: 'posts#index'
  get "posts/new", to: 'posts#new'

  Rails.application.routes.draw do
    resources :posts, only: [:index, :new, :create, :show, :destroy]
  end
    
end
