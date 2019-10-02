class OweMoney < ApplicationRecord
  belongs_to :student
  belongs_to :book
  belongs_to :library
  validates :student_id, :presence => true
  validates :book_id, :presence => true
  validates :library_id, :presence => true
  validates :overdue_fine, :presence => true
  validates :borrow_date, :presence => true
end
