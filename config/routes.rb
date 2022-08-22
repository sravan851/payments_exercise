Rails.application.routes.draw do
  constraints format: :json do
    resources :loans, only: [:index, :show] do
      resources :payments, only: [:index, :show, :create]
    end
  end
  resources :payments, only: [:show], defaults: {format: :json}
end
