Rails.application.routes.draw do
 
   # devise_for :users
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  # :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks" 
}

  root to: 'home#index'
# get 'show' => 'home#show'

  # get  '/users/chat' => 'chat#index'  pusher
  # post '/users/post' => 'chat#post'   pusher
resources :conversations do
    resources :messages
  end
resources :users do
  # resources :conversations
  collection do
     post '/conversations' => 'conversations#create'
     get '/conversations/:id' => 'conversations#show'
   end
end
 
end
