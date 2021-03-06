get '/users/new' do
  @user = User.new
  erb :"users/new", layout: :sign_up_in_layout
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:uid] = @user.id
    redirect '/'
  else
    @error = "Incomplete field"
    erb :"users/new", layout: :sign_up_in_layout
  end
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  erb :"users/show"
end

