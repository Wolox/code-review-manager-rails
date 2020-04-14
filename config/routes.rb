Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'

  scope module: 'api/v1', path: 'api/v1' do
    resources :projects, only: %i[index]
  	resources :contributors, only: [:index]
  end
end
