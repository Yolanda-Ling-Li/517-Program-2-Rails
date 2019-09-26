class Book < ApplicationRecord
  validates :isbn, :presence => true, uniqueness: true
  validates :title, :presence => true
  validates :authors, :presence => true
  validates :language, :presence => true
  validates :published, :presence => true
  validates :edition, :presence => true
  validates :front_cover, :presence => true
  validates :subject, :presence => true
  validates :summary, :presence => true
  validates :special, :presence => true
end
