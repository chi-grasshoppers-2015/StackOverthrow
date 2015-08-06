post "/votes" do
  vote = Vote.create(params[:vote])
  question_id = find_question_id(vote)
  redirect "/questions/#{question_id}"
end

delete "/votes" do
  vote = Vote.find_by(params[:vote])
  question_id = find_question_id(vote)
  vote.destroy
  redirect "/questions/#{question_id}"
end

put "/votes" do
  object_class = params[:vote][:voteable_type]
  object = object_class.classify.find(params[:vote][:voteable_id])
  vote = find_vote(object).update(params[:vote])
  question_id = find_question_id(vote)
  redirect "/questions/#{question_id}"
end
