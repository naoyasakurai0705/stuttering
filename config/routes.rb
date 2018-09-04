Rails.application.routes.draw do
  devise_for :users
  root  'questions#index'                       #ルートパスの指定
  resources :questions, only: [:index, :new, :create]
end
