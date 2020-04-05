Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :consumers, controllers: {
    sessions:      'consumers/sessions',
    passwords:     'consumers/passwords',
    registrations: 'consumers/registrations'
  }

  devise_for :fermers, controllers: {
    sessions:      'fermers/sessions',
    passwords:     'fermers/passwords',
    registrations: 'fermers/registrations'
  }

  namespace :consumers do
    get 'consumers/withdraw'=> 'members#withdraw'
    patch 'consumers/change' => 'members#change'
    put 'consumers/change' => 'members#change'
    resources :consumers,only: [:index,:edit,:update,:show]
    resources :cart_products,only: [:index,:create,:update,:destroy]
    resources :addresses ,only: [:show,:index,:edit,:update,:create,:destroy]
    resources :products ,only: [:show,:index]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/finish' => 'orders#finish'
    resources :orders ,only: [:new,:create,:index,:show]
    delete 'consumers/cart_products/destroy_all'  => 'cart_products#destroy_all'
  end
  namespace :fermers do
    get 'homes/top'
    get '/search' => 'searches#search'
    resources :searches,only: [:index]
    resources :products
    resourc es :columes
    resources :columes_comments,only: [:index,:show]
    resources :columes_favorites,only: [:index]
    resources :products_comments,only: [:index,:show]
    resources :products_favorites,only: [:index]
    resources :order_products,only: [:update]
    resources :orders,only: [:show,:index,:update]
    resources :consumers,only: [:show,:index]
    resources :addresses ,only: [:show,:index,:edit,:update,:create,:destroy]
  end

  namespace :admins do
    get 'homes/top'
    get '/search' => 'searches#search'
    resources :searches,only: [:index]
    resources :categories,only: [:index,:create,:edit,:update,:destroy]
    resources :brands,only: [:index,:create,:edit,:update,:destroy]
    resources :products,only: [:index,:show,:destroy]
    resources :orders,only: [:show,:index,:destroy]
    resources :members,only: [:show,:index,:edit,:update]
    resources :columes,omly: [:index,:show,:destroy]
    resources :columes_comments,only: [:index,:show]
    resources :products_comments,only: [:index,:show]
  end
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
