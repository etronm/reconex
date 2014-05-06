Reconectese::Application.routes.draw do

  scope "(:locale)", locale: /en|es/ do

    resources :visitors, only: [:new, :create]
    resources :contacts, only: [:new, :create]
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :articles, only: [:create, :destroy]
    resources :sections

    root to: redirect('/pages/intro.html')

    match '/signup', to: 'users#new', via: 'get'
    match '/signin', to: 'sessions#new', via: 'get'
    match '/signout', to: 'sessions#destroy', via: 'delete'
  end

end
