Rails.application.routes.draw do
  namespace :admin do
    resources :users, except: [:show]
    resources :courses, except: [:show]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
