Blog::Application.routes.draw do
  resources :users

  resources :articles
  root :to => "articles#index"
end
