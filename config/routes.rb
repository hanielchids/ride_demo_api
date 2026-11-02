Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :drivers, only: %i[index show]
      resources :trips, only: %i[index show] do
        resource :rating, only: :create
      end
    end
  end
end
