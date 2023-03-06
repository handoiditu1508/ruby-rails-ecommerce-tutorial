Rails.application.routes.draw do
  namespace :admin do
    resources :users, except: [:show]
    resources :courses, except: [:show]
  end
  resources :courses, only: [:index, :show]
  post "courses/:id/register", to: "courses#register"
  delete "courses/:id/unregister", to: "courses#unregister"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
