class Post < ActiveRecord::Base
  is_impressionable counter_cache: true
  acts_as_votable
    
  validates :title,   presence: true, length: { maximum: 50 }
  validates :price,   presence: true
  validates :body,    presence: true
  validates :brand,   presence: true

  belongs_to :user
  validates_associated :user, :if => :user_id

  belongs_to :size
  validates_associated :size, :if => :size_id

  has_many :images, dependent: :destroy

  alias_attribute :score, :cached_votes_score 
  alias_attribute :view_count, :impressions_count 
  scope :active, -> { where(visible: true).order('created_at DESC') }
  scope :inactive, -> { where(visible: false).order('created_at DESC') }

  
  def post_title
    "#{title}, size: #{size.name} | @ #{price}"
  end

  def status
    if visible
      "Post is Visible"
    else
      "Post is Not Visible"
    end
  end
  
end
