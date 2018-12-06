Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  get 'posts' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'

  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'

end
