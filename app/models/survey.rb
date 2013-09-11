class Survey < ActiveRecord::Base
  has_many :completions

  has_many :takers, 
           :through => :completions, 
           :class_name => "User",
           :foreign_key => "user_id", 
           :source => :user

  has_many :questions
  
  belongs_to :creator, 
             :class_name => "User", 
             :foreign_key => "user_id"
  
  validates :title, uniqueness: true

end
