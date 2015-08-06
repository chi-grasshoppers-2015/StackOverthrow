post '/comments' do
  if logged_in?
    @user = current_user
    params[:comment][:author_id] = @user.id
    @comment = Comment.create(params[:comment])
    redirect @comment.find_redirect_route #finds route for the comment's answer or question
  else
    erb :"sessions/new"
  end
end

get '/comments/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  if user_is_author(@comment.author_id)
    erb :"comments/edit"
  else
    erb :"sessions/new"
  end
end

put '/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @comment.update(body: params[:comment])
  if @comment.commentable_type == "Question"
    redirect "/questions/#{@comment.commentable_id}##{@comment.id}"
  else
    answer = Answer.find(@comment.commentable_id)
    redirect "/questions/#{answer.question_id}##{@comment.id}"
  end
end

delete '/comments' do
  comment = Comment.find(params[:comment])
  if comment.commentable_type == "Question"
    question = Question.find(comment.commentable_id)
    comment.destroy
    redirect "/questions/#{question.id}"
  else
    answer = Answer.find(comment.commentable_id)
    comment.destroy
    redirect "/questions/#{answer.question_id}##{answer.id}"
  end
end
