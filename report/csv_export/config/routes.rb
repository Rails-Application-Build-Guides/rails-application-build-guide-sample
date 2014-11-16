class CsvExportConstraint
  def self.matches?(request)
    request.params.has_key?(:export_csv)
  end
end

Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index] do
    collection do
      get :search, action: :export_csv, constraints: CsvExportConstraint
      get :search
    end
  end
end
