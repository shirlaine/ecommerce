Rails.application.routes.draw do
  get 'transactions/new'

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

  resources :orders, only: [:show, :create]
  resources :transactions, only: [:new, :create]
  resources :cart_items

  resource :cart, only: [:show]
  post '/cart/:line_id', to: 'carts#add', as: 'add_to_cart'
  delete 'cart/:line_id', to: 'carts#remove', as: 'remove_from_cart'


  post '/sendmail', to: 'pages#sendmail'

end
