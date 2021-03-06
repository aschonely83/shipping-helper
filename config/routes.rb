Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'welcome#home'
  resources :users
  resources :retailers do
    resources :finished_products
  end  
end
