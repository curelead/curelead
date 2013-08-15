class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :username
  validates_uniqueness_of :username , :case_sensitive => false
  validates_length_of :username, :minimum => 5, :message => "username must be at least 5 characters long"
  
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  
  validates_presence_of :email
  validates_uniqueness_of :email , :case_sensitive => false

  has_many :posts, dependent: :destroy
end
