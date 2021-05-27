class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, format: { with: /(.|\s)*\S(.|\s)*/ }
end
