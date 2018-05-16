Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contant"
  resources :portfolios
  get 'angular-items', to: "portfolios#angular"
  resources :blogs do
  	member do
  	  post :toggle_status
  	end
  end

end
