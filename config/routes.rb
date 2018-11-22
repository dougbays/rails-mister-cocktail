Rails.application.routes.draw do

  resources :cocktails, only: [:new, :create, :show, :index] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: :destroy

end


