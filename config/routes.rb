Rails.application.routes.draw do
  resources :buckets
  resources :devise_tests
  devise_for :users
  	resources :categories do
  		resources :stores
  end

  resources :stores do
    resources :menus
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'categories#index'
  post ':store_id/:menu_id/buckets' => 'buckets#create_bucket', as:'create_bucket'
  get ':bucket_id/456/buckets' => 'buckets#change_acount1', as:'change_acount1'
  get ':bucket_id/123/buckets' => 'buckets#change_acount2', as:'change_acount2'
  post ':category_id/:store_id/menus' => 'buckets#create_menu', as:'new_menu'
  
end