enable :sessions

get "/signup" do 
  erb :'signup/signup'
end

post "/signup" do

  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = nil
    redirect to '/'
  else
    erb :"signup/signup"
  end

end
