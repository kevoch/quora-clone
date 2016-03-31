# TO UPVOTE ANSWER

post '/answers/:answer_id/upvote' do 
	answer = Answer.find(params[:answer_id])
	answer.answer_votes.create_with(answer_vote_count: 1).find_or_create_by(user_id: session[:user_id]).update(answer_vote_count: 1)
	redirect '/'
end

# TO DOWNVOTE ANSWER

post '/answers/:answer_id/downvote' do 
	answer = Answer.find(params[:answer_id])
	answer.answer_votes.create_with(answer_vote_count: -1).find_or_create_by(user_id: session[:user_id]).update(answer_vote_count: -1)
	redirect '/'
end

# TO RESET ANSWER VOTES

post '/answers/:answer_id/reset' do 
	answer = Answer.find(params[:answer_id])
	answer.answer_votes.where(user_id: current_user.id).destroy_all
	redirect '/'
end