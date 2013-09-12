class User < ActiveRecord::Base
  has_many :created_surveys, 
              :class_name => 'Survey'

  has_many :answers

  has_many :completions

  has_many :taken_surveys, 
           :through => :completions,
           :source => :survey#,
           # :foreign_key => "survey_id"
           # on a "has_many through"
           # you NEED a source and a foreign key. 
           # you don't need class name. 
           # using only class name works on one-to-many
  

  
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

  def surveys_taken_by_user
    taken_surveys = []
    self.completions.each do |completed|
      taken_surveys << Survey.find(completed.survey_id)
    end
    taken_surveys
  end
  # ^ can be replaced by user.taken_surveys alias *****
  def surveys_not_taken
    Survey.all - surveys_taken_by_user
  end

end
