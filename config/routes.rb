Rails.application.routes.draw do
  
  get 'projects/index'

  get 'projects/new'

  get 'projects/show'

  get 'projects/edit'

  root "wines#index"

	get '/login', to: "sessions#login", as: 'login'
  get '/signup', to: "sessions#signup", as: 'signup'
  post '/login', to: "sessions#attempt_login"
  post '/signup', to: "sessions#create"
  get '/home', to: "sessions#index", as: 'home'
  delete '/logout', to: "sessions#logout", as: "logout"

  resources :searches
  resources :users do
    resources :wines, shallow: true
  end

end


#         login GET    /login(.:format)                    sessions#login
#        signup GET    /signup(.:format)                   sessions#signup
#               POST   /login(.:format)                    sessions#attempt_login
#               POST   /signup(.:format)                   sessions#create
#          home GET    /home(.:format)                     sessions#index
#        logout DELETE /logout(.:format)                   sessions#logout
#    user_wines GET    /users/:user_id/wines(.:format)     wines#index
#               POST   /users/:user_id/wines(.:format)     wines#create
# new_user_wine GET    /users/:user_id/wines/new(.:format) wines#new
#     edit_wine GET    /wines/:id/edit(.:format)           wines#edit
#          wine GET    /wines/:id(.:format)                wines#show
#               PATCH  /wines/:id(.:format)                wines#update
#               PUT    /wines/:id(.:format)                wines#update
#               DELETE /wines/:id(.:format)                wines#destroy
#         users GET    /users(.:format)                    users#index
#               POST   /users(.:format)                    users#create
#      new_user GET    /users/new(.:format)                users#new
#     edit_user GET    /users/:id/edit(.:format)           users#edit
#          user GET    /users/:id(.:format)                users#show
#               PATCH  /users/:id(.:format)                users#update
#               PUT    /users/:id(.:format)                users#update
#               DELETE /users/:id(.:format)                users#destroy