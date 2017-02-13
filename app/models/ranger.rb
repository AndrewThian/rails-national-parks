class Ranger < ApplicationRecord
  has_many :jobs
  has_many :parks, through: :jobs
end
