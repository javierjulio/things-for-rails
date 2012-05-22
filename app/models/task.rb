class Task < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  
  scope :due_today, lambda { where("due_date = ?", Date.today.to_date ) }
  scope :due_till_today, lambda { where("due_date IS NULL OR due_date <= ?", Date.today.to_date ) }
  
  scope :tagged_with_any, lambda { |*tags| joins(:tags).where("tags.id IN (?)", tags.map(&:id)).group("tasks.id").having("COUNT(tags.title) = 2") }

  # The following query will match all tags for a task so task must have all specified 
  # tags to be returned. This is tagged_with_all scope.
  # 
  # http://stackoverflow.com/questions/3876240/need-help-with-sql-query-to-find-things-tagged-with-all-specified-tags
  # 
# SELECT * 
# FROM tasks
#   INNER JOIN tags_tasks tt ON tt.task_id = tasks.id
#   INNER JOIN tags ON tags.id = tt.tag_id
# WHERE tags.id IN (831155591,836111569)
# GROUP BY tasks.id
# HAVING COUNT(tags.title) = 2
  
  validates :title, :presence => true
  
end
