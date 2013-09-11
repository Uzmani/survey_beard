class User < ActiveRecord::Base
  has_many :surveys #alias this to :created_surveys and specify the new source
  has_many :answers
  has_many :choices, through: :answers #do we need this? (lla: yes)
  has_many :completions # this just says the user has many of the joins
  # a user also has many surveys through :completions. alias this to has_many :taken_surveys

  
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