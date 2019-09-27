class Book < ApplicationRecord
  belongs_to :library
  validates :isbn, :presence => true, uniqueness: true
  validates :title, :presence => true
  validates :authors, :presence => true
  validates :language, :presence => true
  validates :published, :presence => true
  validates :edition, :presence => true
  mount_uploader :front_cover, FrontCoverUploader
  validates :subject, :presence => true
  validates :summary, :presence => true
  validates :special, :presence => true
  validates :library_id, :presence => true
end
