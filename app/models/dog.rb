class Dog < ApplicationRecord
  validates :name, presence: :true
  validates :breed, presence: :true
  validates :color, presence: :true
end
