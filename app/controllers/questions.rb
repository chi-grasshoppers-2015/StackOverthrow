get '/questions' do
  @questions = Question.all.reverse
  erb :"questions/index"
end

get '/questions/new' do
  @question = Question.new
  erb :"questions/new"
end

post '/questions' do
  params[:question][:author_id] = session[:uid]
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    erb :"questions/new"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"questions/show"
end

post '/questions/:id/answers' do
  params[:answer][:author_id] = session[:uid]
  @question = Question.find(params[:id])
  params[:answer][:question_id] = @question.id
  @answer = Answer.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}##{@answer.id}"
  else
    erb :"questions/show"
  end
end
