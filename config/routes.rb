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
    resources :consumers,only: [:edit,:update,:show]
    resources :fermers
    resources :columns
    resources :columns_comments,only: [:index,:show,:create,:destroy]
    resources :columns_favorites,only: [:index]
    resources :cart_products,only: [:index,:create,:update,:destroy]
    resources :addresses ,only: [:show,:index,:edit,:update,:create,:destroy]
    resources :products ,only: [:show,:index]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/finish' => 'orders#finish'
    resources :orders ,only: [:new,:create,:index,:show]
    delete 'consumers/cart_products/destroy_all'  => 'cart_products#destroy_all'
  end
  namespace :fermers do
    resources :fermers,only:[:show,:edit,:update]
    resources :searches,only: [:index]
    resources :products
    post 'products/filter_brand' => 'products#filter_brand'
    resources :columns
    resources :columns_comments,only: [:index,:show]
    resources :columns_favorites,only: [:index]
    resources :products_comments,only: [:index,:show]
    resources :products_favorites,only: [:index]
    resources :order_products,only: [:update]
    resources :orders,only: [:show,:index,:update]
    resources :consumers,only: [:show,:index]
    resources :addresses ,only: [:show,:index,:edit,:update,:create,:destroy]
    patch 'fermers/change' => 'fermers#change'
    put 'fermers/change' => 'fermers#change'
  end

  namespace :admins do
    get 'homes/top'
    get '/search' => 'searches#search'
    resources :searches,only: [:index]
    resources :consumers,only: [:show,:index]
    resources :fermer,only: [:show,:index]
    resources :categories,only: [:index,:create,:edit,:update,:destroy]
    resources :brands,only: [:index,:create,:edit,:update,:destroy]
    resources :products,only: [:index,:show,:destroy]
    resources :orders,only: [:show,:index,:destroy]
    resources :columes,omly: [:index,:show,:destroy]
    resources :columes_comments,only: [:index,:show]
    resources :products_comments,only: [:index,:show]
  end
  root 'homes#top'
end
