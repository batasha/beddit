class PostVote < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  belongs_to :post
  belongs_to :user

  validates :post_id, :uniqueness => {:scope => :user_id,
                      :message => "can only vote once per post"}
end