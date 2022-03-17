# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'technologies#index'
  get '/', to: 'technologies#index'
  get ':technology', to: 'technologies#show', as: 'technology'
  get ':technology/:category', to: 'categories#show', as: 'category'
  get ':technology/:category/:repository', to: 'repositories#show', as: 'repository'
end
