Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/sign_out' => 'devise/sessions#destroy'
  resources :flats do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, except: [ :new, :index, :create ]
end
