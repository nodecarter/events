class User::Guest < User
  NAME = "Guest"

  def roles
    [:guest]
  end

  def full_name
    NAME
  end

  def guest?
    true
  end
end
