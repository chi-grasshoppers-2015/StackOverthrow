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
