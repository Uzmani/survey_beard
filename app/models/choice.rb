class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :users, through: :answers


end
