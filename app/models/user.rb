class User < ActiveRecord::Base
  validates :provider, :presence => true
  validates :uid, :presence => true
  
  has_many :posts
  has_many :comments

  include Omniauthable
end