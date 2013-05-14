class Comment < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :body, :parent_id

  belongs_to :parent, :class_name => "Comment", :foreign_key => :parent_id
  belongs_to :post
  belongs_to :user

  has_many :comment_votes
  has_many :comment_ancestries
  has_many :descendants, :through => :comment_ancestries
  has_many :ancestors, :through => :comment_ancestries
  has_many :children, :class_name => "Comment", :foreign_key => :parent_id
end