Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  resources :questions do
    resources :answers, expect: %i[new show]
  end
  #resources :questions, only: %i[index new edit create update destroy show]

  root 'pages#index'
end
