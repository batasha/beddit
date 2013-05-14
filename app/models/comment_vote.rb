class CommentVote < ActiveRecord::Base
  attr_accessible :comment_id, :user_id

  belongs_to :comment
  belongs_to :user

  validates :comment_id, :uniqueness => {:scope => :user_id,
                      :message => "can only vote once per comment"}
end