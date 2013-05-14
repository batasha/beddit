class Post < ActiveRecord::Base
  attr_accessible :url, :user_id, :comments_attributes

  has_many :post_votes
  has_many :comments
  accepts_nested_attributes_for :comments

  belongs_to :user

  def recent_upvotes
    post_votes.where(:created_at => (24.hours.ago..Time.now)).count
  end
end