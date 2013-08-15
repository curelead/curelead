class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :size
  
  validates :user_id, presence: true
  validates :title,   presence: true
  validates :price,   presence: true
  validates :body,    presence: true
  validates :brand,   presence: true
  # validates :size_id, presence: true

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
