Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do

    root 'song#index'

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :song
    resources :author
    resources :category
    resources :singer

    namespace :admins do
      resources :users
      resources :songs
      resources :authors
      resources :categories
      resources :singers
    end
  end
end
