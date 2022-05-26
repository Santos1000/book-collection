Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do #GET /api/v1/books
      resources :books, only: [ :index ]
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
