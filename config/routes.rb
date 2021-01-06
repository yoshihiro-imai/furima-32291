Rails.application.routes.draw do #ルーティング設定

  devise_for :users
  root to: "items#index"
  resources :items, only: [:index,:new,:create]

end
