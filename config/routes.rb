Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new,:create,:destroy]
  resources :users, only: [:create,:new,:show]


  resources :albums, only: [:show, :create, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :bands do
   resources :albums, only: [:new]
 end

 resource :track
end
