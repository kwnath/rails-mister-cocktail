Rails.application.routes.draw do
  resources :cocktails do
    resources :doses
  end
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
