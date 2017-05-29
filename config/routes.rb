Rails.application.routes.draw do

  get 'segssions/create'

  get 'segssions/destroy'

  get 'setssions/create'

  get 'setssions/destroy'

  # devise_for :authcons, :controllers => {registrations: 'Registrations'}
  # get 'sessions/new'

  # devise_for :authcons, :controllers => {Registrations => 'registrations'} do
  #   get "/login", :to => "devise/sessions#new", :as => :login
  #   get "/signup", :to => "devise/Registrations#new", :as => :signup
  #   get "/logout", :to => "devise/sessions#destroy", :as => :logout
  # end

  #facebook login part
  get 'auth/:provider/callback', to: 'setssions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'setssions#destroy', as: 'signout'

  resources :setssions, only: [:create, :destroy]

  #google login part
  # get 'auth/:provider/callback', to: 'segssions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'segssions#destroy', as: 'signout'

  # resources :segssions, only: [:create, :destroy]

  #email login part
  devise_for :authcons, :controllers => {registrations: 'registrations'}
  resources :authcons
  get 'sessions/new'

  post 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#create'

  root 'landpage#index'
  get 'landpage/index', to: 'landpage#index'

  get 'dashboardpage/index', to: 'dashboardpage#index'
  get 'dashboardpage/blog_post', to: 'blog_post#post'
  post 'dashboardpage/insert'
  get 'dashboardpage/page'
  #page routes
  get 'dashboardpage/profilestaff', to: 'dashboardpage#profilestaff'
  get 'dashboardpage/profilepatient', to: 'dashboardpage#profilepatient'
  get 'dashboardpage/profilehelp', to: 'dashboardpage#profilehelp'
  get 'dashboardpage/profilemanagement', to: 'dashboardpage#profilemanagement'
  get 'dashboardpage/profilesetting', to: 'dashboardpage#profilesetting'
  get 'dashboardpage/history', to: 'dashboardpage#history'
  get 'dashboardpage/service', to: 'dashboardpage#service'
  get 'dashboardpage/servicenotification', to: 'dashboardpage#servicenotification'
  get 'dashboardpage/servicerequest', to: 'dashboardpage#servicerequest'
  get 'dashboardpage/transaction', to: 'dashboardpage#transaction'
  get 'dashboardpage/transactionrequest', to: 'dashboardpage#transactionrequest'
  get 'dashboardpage/transactionsetting', to: 'dashboardpage#transactionsetting'

  # email confirmations
  #resources :sessions, only: [:create1, :destroy1]
  # devise_for :users, controllers: { registrations: "registrations" }

  # ssget '/authcons/sign_out', to: 'devise/sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end