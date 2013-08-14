class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  has_many :images

  scope :active, -> { where(visible: true).order('created_at DESC') }
  scope :inactive, -> { where(visible: false).order('created_at DESC') }


  def status
    if visible
      "Post is Visible"
    else
      "Post is Not Visible"
    end
  end
  
end
