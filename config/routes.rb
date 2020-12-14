Rails.application.routes.draw do
  # root
  root to: 'products#index'

  # users
  resource :users
  # products
  resources :products, only: [:index, :show]
  # order_details
  resources :order_details, only: [:create, :update, :destroy]
  # carts
  resource :carts, only: [:show]
  # admin
  get 'admins/new'
  get 'admins/create'
  get 'admins/destroy'
  # checkouts
  get 'checkouts/address', to: 'checkouts#address_form_show'
  post 'checkouts/address', to: 'checkouts#address_set_session'
  get 'checkouts/card', to: 'checkouts#card_form_show'
  post 'checkouts/card', to: 'checkouts#card_set_session'
  get 'checkouts/confirm', to: 'checkouts#confirm'
  post 'checkouts', to: 'checkouts#issue_receipt'
  get 'checkouts/completion', to: 'checkouts#completed'
end
