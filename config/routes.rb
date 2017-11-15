Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  namespace :admin do
    resources :products, except: [:index]
    resources :lines, only: [:update]
  end

    controller :pages do
    get :benefits
    get :index
    end

  resources :carts, only: [:show]
  resources :orders, only: [:show]

  post '/carts/:line_id', to: 'carts#add'
  delete 'carts/:line_id', to: 'carts#remove'

end
