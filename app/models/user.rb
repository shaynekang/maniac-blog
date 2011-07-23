require 'user/omniauth'

class User < ActiveRecord::Base
  validates :provider, :presence => true
  validates :uid, :presence => true
  
  has_many :posts
  has_many :comments
  
  extend OnmiAuth
end