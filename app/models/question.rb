class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
belongs_to :user
validates :body, presence: true





end
