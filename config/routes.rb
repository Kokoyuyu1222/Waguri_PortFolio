Rails.application.routes.draw do
  devise_for :admins
  get 'comsumers/index'
  devise_for :fermers
  devise_for :consumers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
