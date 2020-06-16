Rails.application.routes.draw do
  resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :dispatches, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show, :update, :destroy]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  get "/", to: 'dispatches#index', as: 'root'
  get "/login", to: 'sessions#new', as: 'login'
  get "/register", to: 'users#new', as: 'register'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
