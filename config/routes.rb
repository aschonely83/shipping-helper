Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'welcome#home'
resources :users
resources :retailers
resources :finished_products


get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
post '/logout' => 'sessions#destroy'


get	'/signup' => 'welcome#signup'
post '/signup' => 'user#create' 
end
