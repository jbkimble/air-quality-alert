Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "airquality#index", as: 'root'
  get '/test', to: "welcome#index"
  resources :airquality, only: [:create, :show]
end
