class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :note
      t.boolean :completed
      t.date :due_date

      t.timestamps
    end
  end
end
