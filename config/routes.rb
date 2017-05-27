Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'homepage#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', ad: :unauthenticated_root
    end
  end

  resources :tasks
end
