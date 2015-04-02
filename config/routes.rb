Rails.application.routes.draw do
  get 'sessions/new'

  get '/about_us' => "static_pages#about_us"
  get '/help' => "static_pages#help"
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :categories
  resources :users
  resources :ads

  root "static_pages#home"
end
