class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
has_many :questions
validates :email, presence: true, uniqueness: true,
  format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }
validates :username, presence: true
validates :password, presence: true

  def password

    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    
    @password = BCrypt::Password.create(new_password)
    self.password_hash=@password
  end



  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      return user
    else
      nil
    end
  end


end
