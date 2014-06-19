Reconectese::Application.routes.draw do

  scope "(:locale)", locale: /en|es/ do

    #get "static_pages/home"
    get "static_pages/help"

    resources :visitors, only: [:new, :create]
    resources :contacts, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :users
    resources :articles
    resources :sections
    resources :article_contents


    #root to: redirect('/pages/intro.html')
    root "static_pages#home"

    match '/signup', to: 'users#new', via: 'get'
    match '/signin', to: 'sessions#new', via: 'get'
    match '/signout', to: 'sessions#destroy', via: 'delete'
    match '/compose', to: 'articles#new', via: 'get'
    match '/tagged', to: 'articles#tagged', via: 'get'
    match '/search_section', to: 'sections#search_section', via: 'get'

  end

end
