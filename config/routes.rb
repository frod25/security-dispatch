Rails.application.routes.draw do
  resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :dispatches, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show, :update]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  get "/", to: 'dispatches#index', as: 'root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
