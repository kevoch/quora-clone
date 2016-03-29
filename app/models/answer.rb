class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
belongs_to :question
validates :body, presence: true





end
