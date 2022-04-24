Rails.application.routes.draw do
  get 'quick_time/index'
  get 'ingredient/index'
  get 'ingredient/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'
  resources :recipes
end
