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
    redirect "/question/#{@question.id}"
  else
    erb :"questions/new"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id].to_i)
  erb :"questions/show"
end
