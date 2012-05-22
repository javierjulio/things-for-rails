require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  should validate_presence_of(:title)
  
  context "an existing tag" do
    setup do
      @title = FactoryGirl.create(:tag)
    end
    
    should validate_uniqueness_of(:title)
  end
  
end
