

class AnswerVote < ActiveRecord::Base

  belongs_to :answer
    belongs_to :user

  # validates_presence_of :text, message: "Field Cannot Be Blank"
  # validates_format_of :email, {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ , message: "Email must be a valid email"}
    
end