Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'posts#index'

  get 'pages/index', to: 'pages#index'
  get 'users/:id/likes', to: 'users#likes'
  post "comments/:id/destroy" => "comments#destroy"
  post "comments/:id/destroy" => "comments#destroy"
  delete 'comments/:id', to: 'comments#destroy'


  resources :users, only: [:show, :edit]

  


    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      collection do
        get :search
      end
    end
  
end
