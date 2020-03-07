Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"
  get "/signup", to: "welcome#signup"
  post "/signup", to: "user#create"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  resources :users, only[:create, :show]
  resources :retailers do
    resources :finished_products
  end
  post "/retailers/:id/finishedproducts/new" => 'finishedproducts#add', as: 'add_finished_product' 

end
