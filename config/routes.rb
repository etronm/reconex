Reconectese::Application.routes.draw do
  resources :visitors, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :users, only: [:new, :create]

  #root to: 'visitors#new'
  root to: redirect('/pages/intro.html')

end
