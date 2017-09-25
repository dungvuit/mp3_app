Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do

    root 'songs#index'

    devise_for :users, controllers: {registrations: "users/registrations",
      sessions: "users/sessions", passwords: "users/passwords", confirmations: "users/confirmations"}

    resources :favorites, only: %i[create show destroy]
    resources :favorite_songs, only: %i[create destroy]
    resources :songs do
      resources :comments
      collection do
        get 'search'
      end
    end
    resources :authors
    resources :categories
    resources :singers
    resources :albums do
      collection do
        get 'album_song'
      end
    end
    resources :users, only: :index
    resources :likes, only: %i[create destroy]

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
