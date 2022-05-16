module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def display_color(user)
    "#{user.color}" if user
  end
end