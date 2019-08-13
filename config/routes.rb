Rails.application.routes.draw do

  root to: 'landing_page#index'
  devise_for :users

  # business
  get 'business/:id', to: 'business#show', param: :id
  get 'all_business/:page', to: 'business#index', only: [:index], param: :page

  # Other pages
  get 'landing_page/index'
  get 'informations/index'

  # Admin Control
  get '/admin/users', to: 'users#index'
  get '/admin/find_user', to: 'users#index'
  get '/admin/user/:id', to: 'users#show'
  get '/admin/edit_user/:id', to: 'users#admin_edit', param: :id
  post '/admin/update_user/:id' => 'users#update_user'

  # Buy quotes
  post 'quote/buy_quote/:id' => 'quotes#buy_quote'

  # My Quotes
  get 'wallet', to: 'wallet#index'

end
