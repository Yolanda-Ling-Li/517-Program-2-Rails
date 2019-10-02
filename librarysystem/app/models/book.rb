class Book < ApplicationRecord
  belongs_to :library
  has_many :book_histories, dependent: :destroy
  has_many :check_out, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  has_many :owe_moneys, dependent: :destroy
  has_many :hold_requests, dependent: :destroy

  validates :isbn, :presence => true, uniqueness: true
  validates :title, :presence => true
  validates :authors, :presence => true
  validates :language, :presence => true
  validates :published, :presence => true
  validates :edition, :presence => true
  mount_uploader :front_cover, FrontCoverUploader
  validates_presence_of :front_cover
  validates :subject, :presence => true
  validates :summary, :presence => true
  validates :special, :presence => true
  #validates :borrow_date, :presence => true
  validates :library_id, :presence => true
end
