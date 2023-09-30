# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    devise_for :users,
               controllers: {
               sessions: 'api/sessions',
               registrations: 'api/registrations'
             }
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :companies, only: %i[index]
      resources :users
    end
  end
end
