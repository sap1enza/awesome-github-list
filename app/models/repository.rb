# frozen_string_literal: true

class Repository < ApplicationRecord
  before_validation :set_name, on: :create

  validates :full_name, presence: true, uniqueness: { case_sensitive: false }

  serialize :external_info, Hash

  def set_name
    self.name ||= full_name&.split('/')[1] || full_name
  end
end
