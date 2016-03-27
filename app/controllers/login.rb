enable :sessions
helpers SessionHelper

get '/login' do
  # @greetings = "Welcome back #{@current_user.username}"
  erb :"login/login"
end


post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  byebug
  if @user 
    session[:user_id] = @user.id
    redirect to '/'

  else
    @message = 'Authentication failed! Invalid password or ID! Please try again!'
    erb :"login/login"
  end

end

post '/logout' do

  if logged_in?
    session[:user_id] = nil
    erb :"login/login"
  end
end