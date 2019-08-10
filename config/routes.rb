Rails.application.routes.draw do

  devise_for :users
  get 'business/:id', to: 'business#show', param: :id
  get 'landing_page/index'
  get 'informations/index'

  root to: 'landing_page#index'

end
