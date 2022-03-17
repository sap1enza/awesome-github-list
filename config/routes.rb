# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'repositories#index'

  resources :repositories, only: [:index]
end
