Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'users' do 
    resources 'recipes'
  end

  get '/search' => 'pages#search'
  get '/instructions' => 'pages#instructions'
  get '/ingredients' => 'pages#ingredients'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/' => 'pages#index'
  root 'pages#index'
end
