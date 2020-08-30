Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'posts#index'

  get 'pages/index', to: 'pages#index'
  post "comments/:id/destroy" => "comments#destroy"
  post "comments/:id/destroy" => "comments#destroy"


    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  
    delete 'comments/:id', to: 'comments#destroy'
end
