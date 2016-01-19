Rails.application.routes.draw do

   # devise_for :users
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  # :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks" 
}

  root to: 'home#index'

  get  'chat' => 'chat#index'
  post 'post' => 'chat#post'

  resources :conversations do
    resources :messages
  end

  
end
