# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    full_name { 'octocat/hello-world' }
  end
end
