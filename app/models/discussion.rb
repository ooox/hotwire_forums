# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  validates :name, presence: true
end
