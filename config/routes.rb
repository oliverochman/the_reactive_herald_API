Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :articles, only: [:show, :index]
    end
    namespace :v2, defaults: { format: :json } do
      resources :articles, only: [:create]
    end
  end
end