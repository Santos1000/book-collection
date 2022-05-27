Rails.application.routes.draw do
  devise_for :users
  # get 'explore', to: 'pages#explore'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: [:index, :show, :update, :create, :destroy]
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
