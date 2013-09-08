class Survey < ActiveRecord::Base
  has_many :completions
  has_many :questions
  belongs_to :user

  validates :title, uniqueness: true

end
