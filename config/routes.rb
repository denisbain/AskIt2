Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[create destroy]
  end
  #resources :questions, only: %i[index new edit create update destroy show]

  root 'pages#index'
end
