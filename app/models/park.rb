class Park < ApplicationRecord
  has_many :jobs
  has_many :rangers, through: :jobs

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
