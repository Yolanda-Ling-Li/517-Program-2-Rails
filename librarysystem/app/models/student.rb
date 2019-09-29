class Student < ApplicationRecord
  has_many :book_histories, dependent: :destroy
  has_many :check_out, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def return_id
    return self.id
	end

end
