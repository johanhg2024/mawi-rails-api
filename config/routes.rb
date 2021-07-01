# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :answers, only: %i[index show create]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :questions, only: %i[index show create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
