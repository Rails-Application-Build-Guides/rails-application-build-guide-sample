Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts, only: [:index, :new, :create]
end
