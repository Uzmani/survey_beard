class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.belongs_to :survey
      t.belongs_to :user

      t.timestamps
    end
  end
end
