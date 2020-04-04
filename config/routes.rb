Rails.application.routes.draw do
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
