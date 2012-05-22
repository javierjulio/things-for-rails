FactoryGirl.define do
  
  sequence :title do |n|
    "some-title-#{n}"
  end
  
  factory :tag do
    title "Personal"
    
    factory :tag_home do
      title "Home"
    end
    
    factory :tag_work do
      title "Work"
    end
  end
  
  factory :task do
    title { FactoryGirl.generate :title }
    note "This is a sample note."
    completed false
    
    factory :task_completed do
      completed true
    end
    
    factory :task_due_today do
      due_date { Date.today }
    end
    
    factory :task_due_tomorrow do
      due_date { 2.days.since(Time.now) }
    end
    
    factory :task_overdue do
      due_date { 2.days.ago }
    end
    
    factory :task_with_tags do
      tags do |task|
        [task.association(:tag), task.association(:tag_home)]
      end
    end
  end
  
end
