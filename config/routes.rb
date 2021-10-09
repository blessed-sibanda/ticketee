Rails.application.routes.draw do
  resources :projects, only: [:index, :show] do
    resources :tickets
  end
  namespace :admin do
    root "application#index"
    resources :projects, except: %i[index show]
  end
  devise_for :users
  root "projects#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
