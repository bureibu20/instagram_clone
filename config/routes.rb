Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
      get :favorites
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy, :index]

  root to: "users#new"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
