helpers do
  def match_voter_id(post)
    post.votes.voter_id.include?(current_user.id)
  end

  def find_vote(post)
    post.votes.find_by(voter_id: current_user.id)
  end
end
