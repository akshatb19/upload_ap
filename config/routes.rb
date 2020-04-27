Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :uploads
  delete "destroy", to: "uploads#destroy"
  root 'uploads#new'
end
