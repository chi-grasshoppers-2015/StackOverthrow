get '/sessions/new' do
  @user = User.new
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    session[:uid] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :"sessions/new"
  end
end
