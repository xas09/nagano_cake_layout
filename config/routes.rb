Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
    
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlgti 
  namespace :admin do
    root to: 'homes#top'
    resources :end_users, only: [:index] 
  end
  scope module: :public do
    root to: 'homes#top'
    get "/end_users/mypage" => "end_users#show"
    get "/end_users/mypage/edit" => "end_users#edit"
    patch "/end_users/mypage" => "end_users#update"
    get "/end_users/mypage/confirm" => "end_users#confirm"
    patch "/end_users/mypage/unsubscribe" => "end_users#unsubscribe" 
  end
end
