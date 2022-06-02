Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "customer_imports#new"

  resources :customer_imports, only: [:new]
  resources :customers, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :customer_imports, only: [:create, :index]
      resources :customers, only: [:index]
    end
  end
end
