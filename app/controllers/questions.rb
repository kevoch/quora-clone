enable :sessions

get '/questions/new' do
  erb :"questions/new_question"
end

post '/questions' do
  
  @user = current_user
  @question = @user.questions.new(params[:question])
  
  if @question.save
    redirect to '/'
    #erb :"static/user_profile"
  else
    erb :"questions/new_question"
  end

end

get '/questions/:id' do
  if logged_in?
    @user = current_user
  else
    @user = nil
  end

  @question = Question.find_by(id: params[:id])
  @answers = Answer.where(question_id: @question.id)
  if !@question.nil?
    erb :"static/current"
  else
    redirect to '/' #no id found
  end
end
#===============================================#
get '/questions/:id/edit' do
  @user = current_user
  @question = Question.find_by(id: params[:id])
  if !@question.nil?
    erb :'questions/edit_question'
  else
    redirect to '/' #no id found
  end
end

put '/questions/:id' do
  @user = current_user
  @question = Question.find_by(id: params[:id])
  if @question.update(params[:question])
    redirect to "/questions/#{@question.id}"
  else
    erb :'questions/edit_question'
  end
end
#==============================================#
delete '/questions/:id' do
  @user = current_user
  @question_to_delete = Question.find_by(id: params[:id])
  byebug
  if !@question_to_delete.nil?
    @question_to_delete.destroy
    @message = "Your Question Title: #{@question_to_delete.title} has been deleted!"
    erb :'users/user_profile'
  else
    @message = "No Match Found! Please try again."  
  end
end








