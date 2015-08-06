post '/answers' do
  params[:answer][:author_id] = session[:uid]
  @question = Question.find(params[:question][:id])
  params[:answer][:question_id] = @question.id
  @answer = Answer.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}##{@answer.id}"
  else
    erb :"questions/show"
  end
end

get '/answers/:answer_id/edit' do
  @answer = Answer.find(params[:answer_id])
  if user_is_author(@answer.author_id)
    erb :"answers/edit"
  else
    erb :"sessions/new"
  end
end

put '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update(body: params[:answer])
  if request.xhr?
    status 200
  else
    redirect "/questions/#{@answer.question_id}##{@answer.id}"
  end
end

delete '/answers' do
  answer = Answer.find(params[:answer])
  question = Question.find(answer.question_id)
  answer.destroy
  redirect "/questions/#{question.id}"
end
