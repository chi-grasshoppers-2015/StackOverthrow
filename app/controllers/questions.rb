get '/questions' do
  @questions = Question.all.reverse #shows newest entry first
  erb :"questions/index"
end

get '/questions/new' do
  if logged_in?
    @question = Question.new
    erb :"questions/new"
  else
    redirect "sessions/new"
  end
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


