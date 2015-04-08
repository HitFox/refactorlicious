Rails.application.routes.draw do
  root 'welcome#index'

  get 'exercises/show'
  get 'exercises/index'

  resource :session, only: :destroy do
    get :error
  end

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
end
