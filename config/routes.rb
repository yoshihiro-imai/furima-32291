Rails.application.routes.draw do #ルーティング設定

  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only:[:index,:create]
  end

end
