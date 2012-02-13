require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  test "should not save task without title" do
    task = Task.new
    assert !task.save, "Saved the task without a title."
  end
  
  test "should return all tasks due today" do
    tasks = Task.due_today
    
    tasks.each do |t|
      assert_equal t.due_date, Date.today
    end
  end
  
  test "should return all tasks due today and overdue" do
    tasks = Task.due_till_today
    
    tasks.each do |t|
      assert(t.due_date.nil? || t.due_date <= Date.today, "Retrieved a future task.")
    end
  end
  
  test "should return all tasks tagged with all specified tags" do
    tags = [tags(:personal), tags(:home)]
    
    tasks = Task.tagged_with_any tags(:personal), tags(:home)
    
    tasks.each do |t|
      assert_equal t.tags.map(&:id).sort, tags.map(&:id).sort
    end
  end
  
end
