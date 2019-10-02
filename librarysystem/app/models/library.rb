class Library < ApplicationRecord
  # has_many: books
  # validation: minmum

  validates :name, :presence => true
  validates :university, :presence => true
  validates :location, :presence => true
  validates :maxborrowdays, :presence => true, numericality:{greater_than: 0}
  validates :overduefine, :presence => true, numericality:{greater_than: 0}
  has_many :books, dependent: :destroy
  has_many :check_outs, dependent: :destroy
  has_many :owe_moneys, dependent: :destroy
  has_many :hold_requests, dependent: :destroy
end
