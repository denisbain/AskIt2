Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]

  resources :users, only: %i[new create]

  resources :questions do
    resources :answers, expect: %i[new show]
  end
  #resources :questions, only: %i[index new edit create update destroy show]

  root 'pages#index'
end
