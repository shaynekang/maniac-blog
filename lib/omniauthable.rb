module Omniauthable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_or_create_with_omniauth!(auth)
      users = where(:provider => auth['provider'], :uid => auth['uid'])
      user = if not users.empty?
        users.first
      else
        self.new(:provider => auth['provider'], :uid => auth['uid'])
      end
    
      user.insert_info(auth['user_info'])
      user.save!
      user
    end
  end
  
  module InstanceMethods
    def insert_info(info)
      return unless info
      
      self.name = info['nickname'] unless info['nickname'].blank?
      self.name = info['name'] unless info['name'].blank?
      self.email = info['email'] unless info['email'].blank?
      self.avatar = info['image'] unless info['image'].blank?
    end
  end
  
  included do
    extend ClassMethods
    include InstanceMethods
  end
end