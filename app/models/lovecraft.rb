class Lovecraft < ApplicationRecord
  belongs_to :caffeine
  
  validates :deity, presence: true
  validates :tome, presence: true
  validates :location, presence: true
  validates :word, presence: true
  validates :sentence, presence: true
end
