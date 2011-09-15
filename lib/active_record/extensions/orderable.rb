module ActiveRecord
  module Extensions
    module Orderable
      extend ActiveSupport::Concern

      included do
        def self.oldest
          order("created_at ASC")
        end

        def self.newest
          order("created_at DESC")
        end
      end
    end
  end
end

class ActiveRecord::Base
  include ActiveRecord::Extensions::Orderable
end