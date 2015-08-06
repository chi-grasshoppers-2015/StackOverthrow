post "/votes" do
  vote = Vote.create(params[:vote])
  question_id = find_votable_question_id(vote)
  redirect "/questions/#{question_id}"
end

delete "/votes/:vote_id" do
  vote = Vote.find_by(params[:vote])
  question_id = find_votable_question_id(vote)
  vote.destroy
  redirect "/questions/#{question_id}"
end

put "/votes/:vote_id" do
  object_class = params[:vote][:votable_type]
  object = object_class.constantize.find(params[:vote][:votable_id])
  vote = find_vote(object)
  vote.update(params[:vote])
  question_id = find_votable_question_id(vote)
  redirect "/questions/#{question_id}"
end
