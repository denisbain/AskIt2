# frozen_string_literal: true

Rails.application.routes.draw do
  concern :commentable do
    resources :comments, only: %i[create destroy]
  end

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update]

    resources :questions, concern: :commentable do
      resources :answers, expect: %i[new show]
    end

    resources :answers, expect: %i[new show], concern: :commentable

    namespace :admin do
      resources :users, only: %i[index create]
    end

    root 'pages#index'
  end
end
