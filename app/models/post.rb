class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  
  belongs_to :size
  validates :size, presence: true
  
  validates :title,   presence: true, length: { maximum: 50 }
  validates :price,   presence: true
  validates :body,    presence: true
  validates :brand,   presence: true

  has_many :images

  scope :active, -> { where(visible: true).order('created_at DESC') }
  scope :inactive, -> { where(visible: false).order('created_at DESC') }

  def post_title
    "#{title}, size: #{size} | @ #{price}"
  end

  def status
    if visible
      "Post is Visible"
    else
      "Post is Not Visible"
    end
  end
  
end
