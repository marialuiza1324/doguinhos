class Person < ApplicationRecord
  validates :name, presence: :true
  validates :email, presence: :true
  validates :age, presence: :true
  validates :address, presence: :true
  has_many :dogs
end
