class Cocktail < ApplicationRecord
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses
  validates_uniqueness_of :name
  has_one_attached :photo

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_location,
  #   against: [:name],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end

