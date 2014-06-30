class Survey < ActiveRecord::Base
  has_many :completions

  belongs_to :creator, 
               :class_name => "User", 
               :foreign_key => "user_id"

  has_many :takers, 
           :through => :completions, 
           :source => :user
           # :foreign_key => "user_id" 
           # confused why we need foreign_key
           # based on 
           # http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many

  has_many :questions
  
  
  validates :title, uniqueness: true

  def extract_graph_data
    graph_labels = []
    graph_data = []
    self.questions.first.choices.each do |choice|
      graph_labels << choice.reply
      graph_data <<  choice.answers.length
    end
    return graph_data, graph_labels
  end

end
