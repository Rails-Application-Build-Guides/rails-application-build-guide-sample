Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    collection do
      get :search
    end
  end
end
