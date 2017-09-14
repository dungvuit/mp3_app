Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do

    root 'songs#index'

    devise_for :users, controllers: {registrations: "users/registrations",
      sessions: "users/sessions", passwords: "users/passwords"}

    resources :favorites
    resources :favorite_songs
    resources :songs do
      resources :comments
    end
    resources :authors
    resources :categorys
    resources :singers
    resources :albums do
      collection do
        get 'album_song'
      end
    end
    resources :users
    resources :likes, only: [:create, :destroy]

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
