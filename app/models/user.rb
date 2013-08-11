class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :username
  validates_uniqueness_of :username , :case_sensitive => false
  
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
