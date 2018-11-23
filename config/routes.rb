Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:new, :create, :show, :index] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: :destroy

end


