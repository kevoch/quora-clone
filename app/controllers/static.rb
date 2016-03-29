enable :sessions
helpers SessionHelper



get '/' do
  erb :"static/index"
end

post '/questions' do
  
  user_id = current_user.id.to_i
  
  @question = Question.new(body: params[:questions], user_id: user_id)
  
  if @question.save
    redirect to '/'
  else
    erb :"static/index"
  end


end