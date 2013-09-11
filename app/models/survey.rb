class Survey < ActiveRecord::Base
  has_many :completions
  #also has many users through completions
  has_many :questions
  belongs_to :user #alias to :creator

  validates :title, uniqueness: true

end
