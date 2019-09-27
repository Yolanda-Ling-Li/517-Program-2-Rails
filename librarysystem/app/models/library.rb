class Library < ApplicationRecord
  validates :name, :presence => true
  validates :university, :presence => true
  validates :location, :presence => true
  validates :maxborrowdays, :presence => true, numericality:{greater_than: 0}
  validates :overduefine, :presence => true, numericality:{greater_than: 0}
  has_many:books
end
