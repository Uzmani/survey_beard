class Survey < ActiveRecord::Base
  has_many :completions

  has_many :takers, 
             :through => :completions, 
             :class_name => "User",
             :foreign_key => "user_id", # confused why we need line 6 and 7 based on http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many
             :source => :user

  has_many :questions
  
  belongs_to :creator, 
               :class_name => "User", 
               :foreign_key => "user_id"
  
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
