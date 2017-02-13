class Job < ApplicationRecord
  belongs_to :park
  belongs_to :ranger
end
