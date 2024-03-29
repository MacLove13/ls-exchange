Rails.application.routes.draw do

  root to: 'landing_page#index'
  devise_for :users

  # errors
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#not_found"
  get "/500", to: "errors#not_found"

  # business
  get 'business/:id', to: 'business#show', param: :id
  get 'all_business/:page', to: 'business#index', only: [:index], param: :page
  get 'bankrupt', to: 'business#bankrupt'

  # Other pages
  get 'landing_page/index'
  get 'informations/index'

  # Admin Control
  get 'admin/dashboard', to: 'admin#dashboard'
  get 'admin/users', to: 'users#index'
  get 'admin/find_user', to: 'users#index'
  get 'admin/user/:id', to: 'users#show'
  get 'admin/edit_user/:id', to: 'users#admin_edit', param: :id
  get 'admin/delete_user/:id', to: 'users#admin_del', param: :id
  post 'admin/update_user/:id' => 'users#update_user'
  get 'admin/update_user/:id', to: redirect('/admin/users')
  get 'admin/wallet/:id', to: 'wallet#show'
  get 'admin/config', to: 'admin#config_page'
  post 'admin/config', to: 'admin#config_page'

  # Buy quotes
  post 'quote/buy_quote/:id' => 'quotes#buy_quote'
  get 'quote/buy_quote/:id', to: redirect('/wallet/1')

  # Sell quotes
  post 'quote/sell_quote/:id' => 'quotes#sell_quote'
  get 'quote/sell_quote/:id', to: redirect('/wallet/1')

  # My Quotes
  get 'wallet/:page', to: 'wallet#index', only: [:index], param: :page

  # Security Investments
  get 'safe_investiment', to: 'safe_investiment#index'

end
