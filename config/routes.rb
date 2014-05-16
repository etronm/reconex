Reconectese::Application.routes.draw do

  scope "(:locale)", locale: /en|es/ do

    #get "static_pages/home"
    get "static_pages/help"

    resources :visitors, only: [:new, :create]
    resources :contacts, only: [:new, :create]
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :articles
    resources :sections

    #root to: redirect('/pages/intro.html')
    root "static_pages#home"

    match '/signup', to: 'users#new', via: 'get'
    match '/signin', to: 'sessions#new', via: 'get'
    match '/signout', to: 'sessions#destroy', via: 'delete'
    match '/compose', to: 'article#new', via: 'get'
    match '/review', to: 'article#index', via: 'get'

  end

end
