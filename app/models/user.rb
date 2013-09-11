class User < ActiveRecord::Base
  has_many :created_surveys, 
              :class_name => 'Survey',
              :source => :survey

  has_many :answers
  has_many :completions

  has_many :taken_surveys, 
              :through => :completions,
              :class_name => "Survey",
              :source => :survey,
              :foreign_key => "survey_id"

  
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
