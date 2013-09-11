#because an answer belongs to a choice which belongs to a question, you don't really need this column
class AddQuestionIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :question_id, :string
  end
end
