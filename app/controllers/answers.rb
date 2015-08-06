post '/answers' do
  p params
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
  erb :"answers/edit"
end

put '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update(params[:answer])
  redirect "/questions/#{@answer.question_id}##{@answer.id}"
end


