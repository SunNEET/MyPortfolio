Rails.application.routes.draw do
  resources :portfolios
  get 'angular-items', to: "portfolios#angular"

  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contant"

  resources :blogs do
	member do
	  post :toggle_status
	end
  end

end
