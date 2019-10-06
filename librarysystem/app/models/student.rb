class Student < ApplicationRecord
  has_many :book_histories, dependent: :destroy
  has_many :check_out, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  has_many :owe_moneys, dependent: :destroy
  has_many :hold_requests, dependent: :destroy
  has_many :book_approvals, dependent: :destroy

  validates :email, :presence =>true, uniqueness: true
  validates :name, :presence => true
  validates :password, :presence => true
  validates :university, :presence  => true



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def return_id
    return self.id
	end

end
