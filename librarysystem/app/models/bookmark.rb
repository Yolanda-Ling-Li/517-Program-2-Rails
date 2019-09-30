class Bookmark < ApplicationRecord
  belongs_to :student
  belongs_to :book
  validates :student_id, :presence => true
  validates :book_id, :presence => true
end
