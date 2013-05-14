class Email < ActiveRecord::Base
  attr_accessible :email, :user_id

  belongs_to :user

  validates :email, :uniqueness => true
end