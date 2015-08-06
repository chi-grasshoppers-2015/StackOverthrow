get '/users/new' do
  @user = User.new
  erb :"users/new", layout: :sign_up_in_layout
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/sessions/new'
  else
    erb :"users/new", layout: :sign_up_in_layout
  end
end

