helpers do
  def match_voter_id(post)
    votes = post.votes.map{|vote| vote.voter_id}
    votes.include?(current_user.id)
  end

  def find_vote_value(post)
    matching_votes = post.votes.map do |vote|
      if vote.voter_id == current_user.id
        vote
      end
    end
    matching_votes.compact!
    matching_votes[0].value if matching_votes[0]
  end

  def find_vote(post)
    matching_vote = post.votes.map do |vote|
      if vote.voter_id == current_user.id
        vote
      end
    end
    matching_vote.compact!
    matching_vote[0] if matching_vote[0]
  end

  def find_question_id(vote)
    object_class = vote.votable_type
    object = object_class.constantize.find(vote.votable_id)
    if object_class == "Question"
      object.id
    elsif object_class == "Answer"
      object.question_id
    end
  end
end
