Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  get '/oauth/connect', to: 'index#instagram', as: :instagram_connect

  get '/oauth/callback', to: 'index#create_instagram', as: :instagram_receive

  resources :songs, only: [ :index, :show, :new, :create ]

  get '/instagram', to: 'instagram#create', as: :instagram

end
