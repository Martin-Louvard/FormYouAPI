class Session < ApplicationRecord
    belongs_to :formation
  belongs_to :classroom
  has_many :participations, dependent: :destroy
end
