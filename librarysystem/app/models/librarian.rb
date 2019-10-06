class Librarian < ApplicationRecord
  belongs_to :library
  validates :name, :presence => true
  validates :password, :presence => true
  validates :email, :presence => true
  validates :library, :presence => true
  RailsAdmin.config do |config|
    config.model 'Librarian' do
      edit do
        field :name
        field :email
        field :password
        field :library_id, :enum do
          enum do
            Library.all.collect{|c| [c.name, c.id]}
          end
        end
      end
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
