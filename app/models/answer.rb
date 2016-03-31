class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
belongs_to :user
    belongs_to :question
    has_many :answer_votes, dependent: :destroy #DESTROY ANSWER VOTES IF ANSWER IS DELETED

  validates_presence_of :text, message: "Field Cannot Be Blank"




end
