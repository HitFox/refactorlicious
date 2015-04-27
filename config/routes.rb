Rails.application.routes.draw do
  root 'welcome#index'

  resources :exercises, only: [:show, :index] do
      patch :mark_as_finished
  end

  resource :session, only: :destroy do
    get :error
  end

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
end
