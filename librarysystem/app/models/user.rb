class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ROLES = {0 => :student, 1 => :librarian, 2 => :admin}

  # attr_reader :role

  # def initialize(role_id = 0)
  #   @role = ROLES.has_key?(role_id.to_int) ? ROLES[role_id.to_int] : ROLES[0]
  # end

  def role?(role_name)
    role == role_name
  end

  def admin?
    self.role == "admin"
	end

	def student?
    self.role == "student"
	end

	def librarian?
    self.role == "librarian"
	end

end
