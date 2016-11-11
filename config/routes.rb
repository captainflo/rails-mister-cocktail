Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:create, :edit, :update, :destroy]
  end
end
