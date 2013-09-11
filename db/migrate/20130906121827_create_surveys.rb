class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.belongs_to :user
      # alternatively, 
      # t.integer :creator_id, with creator_id as foreign key in survey model.

      t.timestamps
    end
  end
end
