class Size < ActiveRecord::Base
  has_many :posts, inverse_of: :size

  validates :name, presence: true, uniqueness: true
end
