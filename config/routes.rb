Rails.application.routes.draw do
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  get '/contact_us', to: 'pages#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :todos # create the 7 routes for the todos resource
end
