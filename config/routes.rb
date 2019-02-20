Rails.application.routes.draw do

  root 'stores#index'

  #resources: "controller name"
  resources :stores do
    resources :items
  end

  resources :items do
    resources :comments
  end

end
