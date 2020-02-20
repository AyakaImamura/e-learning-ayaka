Rails.application.routes.draw do
  get 'answers/new'
  root 'static_pages#home'
  
  resources :users
  resources :sessions, only: [:create] # 9行目と10行目が存在するから、:newや:logoutは必要ない(なくてもエラーは出ないけど、たくさんルーツがでて見づらい)
  resources :categories
  resources :answers
  
  namespace :admin do
    resources :categories do
      resources :words
    end
  end

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # resources :usersと入力した瞬間に、new.htmlに飛べるようになる。
  # その上で、5行目は、URLを/signupと設定し、そこに飛ばすとusers#newというページにリンクするというカスタマイズ
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
