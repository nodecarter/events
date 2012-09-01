Events::Application.routes.draw do
  root to: "welcome#index"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :show, :create]

end
