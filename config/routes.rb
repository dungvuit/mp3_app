Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do

    root 'songs#index'

    devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}

    resources :songs
    resources :authors
    resources :categorys
    resources :singers
    resources :albums do
      collection do
        get 'album_song'
      end
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :update]

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
