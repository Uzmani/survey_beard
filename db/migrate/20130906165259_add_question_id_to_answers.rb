class AddQuestionIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :question_id, :string
  end
end
