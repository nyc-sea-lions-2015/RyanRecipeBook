get '/users' do
  @users = User.all
  erb :'user/all_users'
end

get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  user = User.find_by(name: params[:name])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    session[:error] = "Login failed"
    redirect '/login'
  end
end

post '/signup' do
  new_user = User.new(name: params[:name],
                      password: params[:password])
  if new_user.save
    redirect '/login'
  else
    [404, "user not created"]
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
