module Postable

  def formatted_post_date
    self.created_at.strftime("%b %-d '%y")
  end

  def author_username
    self.author.username
  end

end
