Rails.application.routes.draw do
  devise_for :admins, controllers: {
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
  end
  scope module: :public do
    root to: 'homes#top'
    get "/end_users/mypage" => "end_users#show"
  end
end
