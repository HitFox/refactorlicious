Rails.application.routes.draw do
  root 'welcome#index'

  resources :exercises, only: [:show, :index, :update]

  resource :session, only: :destroy do
    get :error
  end

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
end
