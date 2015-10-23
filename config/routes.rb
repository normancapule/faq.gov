Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resource :session, only: %i(show create destroy)
      resource :registration, only: %i(create)
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
  get "/home/*path" => "application#index"
  get "/login" => "application#index"
end
