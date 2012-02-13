class CreateTagTaskJoinTable < ActiveRecord::Migration
  
  def change
    create_table :tags_tasks, :id => false do |t|
      t.integer :task_id
      t.integer :tag_id
    end
  end
  
end
