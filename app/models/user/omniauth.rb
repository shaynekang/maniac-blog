class User < ActiveRecord::Base
  module OnmiAuth
    def find_or_create_with_omniauth!(auth)
      users = where(:provider => auth['provider'], :uid => auth['uid'])
      if not users.empty?
        users.first
      else
        create!(:provider => auth['provider'], :uid => auth['uid'])
      end
    end
  end
end