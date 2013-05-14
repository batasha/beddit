class User < ActiveRecord::Base
  attr_accessible :username, :biography, :emails_attributes,
                  :password

  has_many :emails
  has_many :posts
  accepts_nested_attributes_for :emails

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
end