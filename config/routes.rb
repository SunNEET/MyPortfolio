Rails.application.routes.draw do
  resources :portfolios

  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contant"

  resources :blogs do
	member do
	  post :toggle_status
	end
  end

end
