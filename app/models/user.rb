class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :full_name, :password, :password_confirmation

  validates :email, email: true, uniqueness: true, presence: true

  has_many :events

  def roles
    [:user]
  end

  def to_s
    full_name.present? ? full_name : email
  end
end
