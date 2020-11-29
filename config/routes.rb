Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  resources :order_details, only: [:create, :update, :destroy]
  resources :carts, only: [:index]
  get 'checkouts/address', to: 'checkouts#address_form_show'
  post 'checkouts/address', to: 'checkouts#address_set_session'
  get 'checkouts/card', to: 'checkouts#card_form_show'
  post 'checkouts/card', to: 'checkouts#card_set_session'
  get 'checkouts/confirm', to: 'checkouts#confirm'
  post 'checkouts', to: 'checkouts#issue_receipt'
  get 'checkouts', to: 'checkouts#completion_show'
end
