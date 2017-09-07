Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "airquality#index", as: 'root'
  resources :airquality, only: [:create]
  resources :alert, only: [:show, :create, :destroy, :index, :edit]

  resources :youralerts, only: [:index]
end
