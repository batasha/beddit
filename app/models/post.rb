class Post < ActiveRecord::Base
  attr_accessible :url, :user_id, :comments_attributes

  has_many :comments
  accepts_nested_attributes_for :comments

  belongs_to :user
end