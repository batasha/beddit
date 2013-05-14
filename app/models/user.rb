class User < ActiveRecord::Base
  attr_accessible :username, :biography, :emails_attributes,
                  :password

  has_many :emails
  has_many :posts
  has_many :post_votes
  has_many :comment_votes
  accepts_nested_attributes_for :emails

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true

  def to_s
    self.username
  end
end
