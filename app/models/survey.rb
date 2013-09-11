class Survey < ActiveRecord::Base
  has_many :completions
  #also has many users through completions
  has_many :questions
  
  belongs_to :creator, class_name: "User", :foreign_key => "user_id"
  
  validates :title, uniqueness: true

end
