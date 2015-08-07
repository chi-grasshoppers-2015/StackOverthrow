get '/sessions/new' do
  @user = User.new
  erb :"sessions/new", layout: :sign_up_in_layout
end

post '/sessions' do
  if params[:user][:password] == "" || params[:user][:username] == ""
    @error = "You must fill out all fields"
    erb :"sessions/new", layout: :sign_up_in_layout
  else
    @user = User.authenticate(params[:user][:username], params[:user][:password])
    if @user
      session[:uid] = @user.id
      redirect "/users/#{@user.id}"
    else
      erb :"sessions/new", layout: :sign_up_in_layout
    end
  end
end

delete '/sessions' do
  session[:uid] = nil
  redirect "/questions"
end
