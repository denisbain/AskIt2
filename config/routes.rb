Rails.application.routes.draw do
  resources :questions do
    resources :answers, expect: %i[new show]
  end
  #resources :questions, only: %i[index new edit create update destroy show]

  root 'pages#index'
end
