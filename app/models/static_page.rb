class StaticPage < ActiveRecord::Base
     validates :user, :movie, :comment, presence: true
end
