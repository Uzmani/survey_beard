class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers
  has_many :choices, through: :answers #do we need this?
  has_many :completions

  
  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "You must enter a valid email address." }

 
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end


# alex = User.first
# alex.choices => [choice object 1, choice object 2...]
#   but the choices dont map to alex in a meaningful way.. 
#   they represent the choices that alex had available to him/her,
#   but not the choice that he/she actually made.... 


# user.completions => [completion object 1, completion object 2...]
# each completion object maps to this user (check)
# each completion object maps to a survey (ok)
#   so => this method gives you the surveys a user has completed.

# user.completions.map {|completion| completion.survey}
#   => gives you the surveys that this particular user completed.
