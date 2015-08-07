helpers do
  def logged_in?
    session[:uid]
  end

  def current_user
    User.find(session[:uid])
  end

  def user_is_author(user_id)
    current_user.id == user_id
  end

  def ad_generator
   ad_num = [*1..6].sample

    case ad_num
    when 1
      "<h5>Nickle ads</h5>
      <p>Need to spend extra money?</p>
      <p>Email at nbkincaid@gmail.com for ways to get rid of excess cash.</p>"
    when 2
      "<h5>Jasmine ads</h5>
      <p>Have extra cute puppies?</p>
      <p>Email at Jasmine@heroforhire.com for ways to get rid of excess pups.</p>"
    when 3
      "<h5>Spencer FOR HIRE</h5>
      <p>Need to win an ultimate epic tournament of sorts?</p>
      <p>Email at Spencer@netscape.net for ways to destroy the competition. BROTHER!</p>"
    when 4
      "<h5>Matt ads</h5>
      <p>Bad shoulders?</p>
      <p>Email at MATT@gmail.com for ways to drunkenly pop that arm back in the socket.</p>"
    when 5
      "<h5>Connor ads</h5>
      <p>Got chicken brah?</p>
      <p>Email at connor@chickens4lyfe.com for eggselent ways to give up those chickens brahhhhh.</p>"
    when 6
      "<h5>Connorle ads</h5>
      <p>Need to spend extra money on misspellings</p>
      <p>Email at ccring@gmail.com for ways to get rid of excess spell checks.</p>"
    end
  end

end
