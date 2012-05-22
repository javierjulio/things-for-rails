require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  should validate_presence_of(:title)
  
  test "should return all tasks due today" do
    FactoryGirl.create(:task)
    FactoryGirl.create(:task_due_today)
    FactoryGirl.create(:task_overdue)
    
    tasks = Task.due_today
    
    tasks.each do |t|
      assert_equal t.due_date, Date.today
    end
  end
  
  test "should return all tasks due today and overdue" do
    FactoryGirl.create(:task)
    FactoryGirl.create(:task_due_today)
    FactoryGirl.create(:task_overdue)
    FactoryGirl.create(:task_due_tomorrow)
    
    tasks = Task.due_till_today
    
    tasks.each do |t|
      assert(t.due_date.nil? || t.due_date <= Date.today, "Retrieved a future task.")
    end
  end
  
  test "should return all tasks tagged with all specified tags" do
    FactoryGirl.create(:task) # default has no tags
    task = FactoryGirl.create(:task_with_tags)
    
    tags = task.tags
    
    tasks = Task.tagged_with_any tags
    
    
    tasks.each do |t|
      assert_equal t.tags.map(&:id).sort, tags.map(&:id).sort
    end
  end
  
end
