# TO UPVOTE

post '/questions/:question_id/upvote' do 
	question = Question.find(params[:question_id])
	question = question.question_votes.create_with(question_vote_count: 1).find_or_create_by(user_id: session[:user_id]).update(question_vote_count: 1)
	redirect '/'
end

# TO DOWNVOTE

post '/questions/:question_id/downvote' do
	question = Question.find(params[:question_id])
	# byebug
	question = question.question_votes.create_with(question_vote_count: -1).find_or_create_by(user_id: session[:user_id]).update(question_vote_count: -1)
	redirect '/'
end

# TO RESET

post '/questions/:question_id/reset' do
	question = Question.find(params[:question_id])
	question.question_votes.where(user_id: current_user.id).destroy_all
	redirect '/'
end