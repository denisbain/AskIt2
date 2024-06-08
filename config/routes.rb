# frozen_string_literal: true

require 'sidekiq/web'

class AdminConstraint
  # На /sidekiq приходит запрос и перенаправляется сюда для проверки.
  def matches?(request)
    # Второе условие выполняется, если пользлватель поставил галочку запомнить меня.
     user_id = request.session[:user_id] || request.cookie_jar.encrypted[:user_id]
    # Допуск на страницу sidekiq только для администратора.
     User.find_by(id: user_id)&.admin_role?
  end
end

Rails.application.routes.draw do
  #Интерфейс sidekiq подключается по этому адресу.

  mount Sidekiq::Web => '/sidekiq', :constraints => AdminConstraint.new
  concern :commentable do
    resources :comments, only: %i[create destroy]
  end

  namespace :api do
    resources :tags, only: :index
  end
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resource :password_reset, only: %i[new create edit update]

    resources :users, only: %i[new create edit update]

    resources :questions do
      resources :comments, only: %i[create destroy]
      resources :answers, expect: %i[new show]
    end

    resources :answers, expect: %i[new show] do
      resources :comments, only: %i[create destroy]
    end

    namespace :admin, constraints: AdminConstraint.new do
      resources :users, only: %i[index create edit update destroy]
    end

    root 'pages#index'
  end
end
