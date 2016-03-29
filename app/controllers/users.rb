enable :sessions
helpers SessionHelper


get "/users/:id" do
  if params[:id] == current_user.username
    @user = "#{current_user.username}'s profile "
  else
    @user_id = params[:id]
  end

erb :"users/users"
end