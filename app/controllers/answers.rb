enable :sessions 

get '/questions/:question_id/answers/new' do
  @user = current_user
  @question = Question.find_by(id: params[:question_id])
  erb :"answers/create_answer"
end

post '/questions/:question_id/answers' do
     @user = current_user
     @question = Question.find_by(id: params[:question_id]) 
     @answers = Answer.where(question_id: @question.id)
     @answer= Answer.new(params[:answer].merge(user_id: @user.id, question_id: @question.id))
     byebug
    if @answer.save

      erb :'static/current'
    else
      @answer_error = "Submission failed! Please try again."
      erb :'static/current'
    end
end

delete '/answers/:answer_id' do
  @user = current_user
  answer = Answer.find_by(id: params[:answer_id])
  @question = answer.question
  
  @answers = Answer.where(question_id: @question.id)
  answer.destroy  
  erb :'static/current'

end
