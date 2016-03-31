helpers SessionHelper



get '/' do

  @user = current_user
  @questions = Question.all
  erb :"static/index"
end

get '/new_question' do

  @user = current_user
  erb :"questions/new_question"

end  

get '/user_profile' do
  @user = current_user
  @answers = Answer.where(user_id: @user.id)
  erb :"users/user_profile"
end


get '/users/:id' do

  @user = User.find_by(id: params[:id])
  erb :"users/user_profile"
end



