Rails.application.routes.draw do
  get 'business/:id', to: 'business#show', param: :id
  get 'landing_page/index'
  get 'informations/index'

  root 'landing_page#index'
end
