get '/login' do
  erb: 'auth/login'
end

post 'login' do
  user = User.find_by(name: params[:name])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    session[:error] = "Login failed"
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
