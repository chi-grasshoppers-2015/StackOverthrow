helpers do


  def logged_in?
    current_user
  end

  def current_user
    User.find(session[:uid])
  end

  def user_is_author(user_id)
    current_user.id == user_id
  end

end
