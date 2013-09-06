class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :answer_format
      t.belongs_to :survey

      t.timestamps

    end
  end
end
