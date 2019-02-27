Rails.application.routes.draw do
  devise_for :users
  root to: "blogs#index"
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
