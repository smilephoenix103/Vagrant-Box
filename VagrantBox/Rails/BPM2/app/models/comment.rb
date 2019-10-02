class Comment < ApplicationRecord
  belongs_to :comment_on, polymorphic: true
end
