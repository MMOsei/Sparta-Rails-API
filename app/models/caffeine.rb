class Caffeine < ApplicationRecord
  has_many :lovecrafts

  validates :blend_name, presence: true
  validates :origin, presence: true
  validates :variety, presence: true
  validates :notes, presence: true
  validates :intensifier, presence: false
end
