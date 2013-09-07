class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :users, through: :answers

  before_save :increment

  def increment
    
    
  end

end
