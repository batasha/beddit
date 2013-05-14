class Comment < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :body

  belongs_to :post
  belongs_to :user
end