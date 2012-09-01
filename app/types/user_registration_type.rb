class UserRegistrationType < User
  extend BaseType
  attr_accessible :full_name, :email, :password, :password_confirmation

  validates :password, presence: true, length: { in: 5..50 }
  validates :password_confirmation, presence: true
end
