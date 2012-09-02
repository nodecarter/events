Events::Application.routes.draw do

  root to: "welcome#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :create]
  resources :events, only: [:index]

  namespace :account do
    root to: "welcome#index"
    resource :user, :only => [:edit, :update, :destroy]
    resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
