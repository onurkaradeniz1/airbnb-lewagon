Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/sign_out' => 'devise/sessions#destroy'
  get 'my_flats', to: 'flats#my_flats'
  resources :flats do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: [ :new, :index, :create ] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, except: [ :new, :create ]
  get '/bookings', to: 'bookings#index'
  resources :bookings, except: %i[new index create]
end
