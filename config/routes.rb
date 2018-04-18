Rails.application.routes.draw do
  get 'charts/index'

  get 'ticket_metrics/index'

  get 'ticket_metrics/show'

  get 'ticket_metrics/edit'

  get 'ticket/index'

  get 'ticket/show'

  get 'ticket/edit'

  get 'user/index'

  get 'user/show'

  get 'user/edit'

  get 'welcome/index'

  get 'welcome/about'

  root 'charts#index'

  resources :users, defaults: { format: :json }

  resources :tickets, defaults: { format: :json }

  resources :ticket_metrics, defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
