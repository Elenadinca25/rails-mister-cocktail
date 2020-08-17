class Cocktail < ApplicationRecord
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses
  validates_uniqueness_of :name
  has_one_attached :photo
end
