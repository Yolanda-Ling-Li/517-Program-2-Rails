class BookHistory < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :borrow_date, :presence => true
end
