Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do

    root 'song#index'
    devise_for :users, controllers: {registrations: "users/registrations"}

    resources :song
    resources :author
    resources :category
    resources :singer
    resources :album

    namespace :admins do
      resources :users
      resources :songs
      resources :authors
      resources :categories
      resources :singers
      resources :albums
    end
  end
end
