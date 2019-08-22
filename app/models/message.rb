class Message < ApplicationRecord
  belongs_to :group , dependent: :destroy
end
