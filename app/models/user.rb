class User < ActiveRecord::Base
  attr_accessible :username, :biography, :emails_attributes

  has_many :emails, :posts
  accepts_nested_attributes_for :emails

  validates :username, :presence => true, :uniqueness => true
end