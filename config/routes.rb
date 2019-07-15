Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  root 'rankings#index'
  resources :users
  resources :rankings do
    resources :items do
      resources :votes
    end
  end

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'

  # get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
  # get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end 
end
