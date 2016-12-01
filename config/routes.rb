Rails.application.routes.draw do
  mount SwaggerYard::Rails::Engine, at: "/swagger"

  resources :users, only: [:create, :show, :index]
end
