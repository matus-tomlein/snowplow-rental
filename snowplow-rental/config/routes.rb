# frozen_string_literal: true

Rails.application.routes.draw do
  resources :snowplows do
    resources :reservations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'snowplows#index'
end
