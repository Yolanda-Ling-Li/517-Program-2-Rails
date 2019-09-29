class Studentuser < ApplicationRecord
    validates :name, :presence => true
    validates :university, :presence => true
    validates :email, presence: true, email: true
    validates :maxborrowdays, presence:true,numericality:{greater_than: 0}
end
