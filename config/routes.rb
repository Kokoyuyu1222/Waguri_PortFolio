Rails.application.routes.draw do
  namespace :consumer do
    get 'cart_products/index'
  end
  namespace :fermer do
    get 'follows/index'
  end
  namespace :consumer do
    get 'follows/index'
  end
  namespace :consumer do
    get 'colums/index'
  end
  namespace :consumer do
    get 'fermers/index'
  end
  namespace :consumer do
    get 'products/index'
  end
  namespace :consumer do
    get 'addresses/index'
  end
  namespace :fermer do
    get 'addresses/index'
  end
  namespace :fermer do
    get 'brands/index'
  end
  namespace :fermer do
    get 'categories/index'
  end
  namespace :admin do
    get 'columes/index'
  end
  namespace :fermer do
    get 'consumers/index'
  end
  namespace :fermer do
    get 'columes/index'
  end
  namespace :fermer do
    get 'products/index'
  end
  namespace :admin do
    get 'fermers/index'
  end
  namespace :admin do
    get 'consumers/index'
  end
  namespace :admin do
    get 'products/index'
  end
  namespace :admin do
    get 'brands/index'
  end
  namespace :admin do
    get 'categories/index'
  end
  devise_for :admins
  get 'comsumers/index'
  devise_for :fermers
  devise_for :consumers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
