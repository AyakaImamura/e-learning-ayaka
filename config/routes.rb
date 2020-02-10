Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :users
  get '/signup', to: 'users#new'
  # resources :usersと入力した瞬間に、new.htmlに飛べるようになる。
  # その上で、5行目は、URLを/signupと設定し、そこに飛ばすとusers#newというページにリンクするというカスタマイズ
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
