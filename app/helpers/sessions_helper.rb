module SessionsHelper
  def login(username, password)
    user = User.find_by_username(username)
    if password == user.password
      user.remember_token = SecureRandom.hex(16)
      user.save!

      session[:remember_token] = user.remember_token

      true
    else
      false
    end
  end

  def current_user
    return nil if session[:remember_token].nil?
    @user ||= User.find_by_remember_token(session[:remember_token])
  end

  def logout
    current_user.remember_token = nil
    current_user.save!

    session[:remember_token] = nil
  end

  def logged_in?
    not current_user.nil?
  end
end