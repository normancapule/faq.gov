require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resource :session, only: %i(show create destroy)
      resource :registration, only: %i(create)
      resources :search, only: [:index]
      resources :categories do
        resources :articles
      end
      resources :articles do
        resources :comments
        resources :tags
        resources :tips
      end
    end
  end

  root :to => "application#index"
  get "/articles/*path" => "application#index"
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'r1sk' && password == 'r1sk'
  end if Rails.env.production?
  mount Sidekiq::Web => '/sidekiq'
end
