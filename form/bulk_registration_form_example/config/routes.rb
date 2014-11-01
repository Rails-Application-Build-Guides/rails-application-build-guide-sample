Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :new, :create] do
    collection do
      get :search
    end
  end
end
