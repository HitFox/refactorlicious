Rails.application.routes.draw do
  root 'welcome#index'

  resources :exercises, only: [:show, :index, :create, :new] do
      patch :submit
  end

  get '/session/error'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  namespace :admin do
    resources :exercises, only: [:edit, :update, :index]
  end
end
