post '/comments' do
  @user = User.find(session[:uid])
  @comment = Comment.create(params[:comment])
  redirect @comment.find_redirect_route #finds route for the comment's answer or question
end
