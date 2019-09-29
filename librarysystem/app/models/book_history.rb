class BookHistory < ApplicationRecord
  belongs_to :student
  belongs_to :book
  validates :student_id, :presence => true
  validates :book_id, :presence => true
  validates :borrow_date, :presence => true
end
