Rails.application.routes.draw do
  devise_for :users
  root "prototypes#index"

  scope module: :prototypes do
    resources :popular, only: :index
  end

  resources :prototypes do
    scope module: :prototypes do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: :create
    end
  end

  resources :users, only: [:index, :show, :edit, :update]

end
