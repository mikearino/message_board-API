class Group < ApplicationRecord
  has_many :messages
  validates :topic, presence: true
end
