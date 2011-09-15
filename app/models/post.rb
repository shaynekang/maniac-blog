class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  accepts_nested_attributes_for :comments, :allow_destroy => :true
  
  paginates_per 3
end