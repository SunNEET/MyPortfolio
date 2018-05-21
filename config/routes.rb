Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :portfolios
  get 'angular-items', to: "portfolios#angular"
  
  resources :blogs do
  	member do
  	  post :toggle_status
  	end
  end

  root to: "pages#home"
end
