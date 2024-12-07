Rails.application.routes.draw do
  devise_for :users
  root to: "main#index"

  resources :main
  resources :books do
    resources :comments
  end 
  #get "называю как хочу" => "контролер#метод в контролере + такое же название html файла"
end
