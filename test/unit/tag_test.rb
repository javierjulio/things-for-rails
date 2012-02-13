require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  test "should not save tag without title" do
    tag = Tag.new
    assert !tag.save, "Saved the tag without a title."
  end
  
  test "should not save tag without unique title" do
    tag = Tag.new :title => tags(:personal).title
    assert !tag.save, "Saved a duplicate tag."
  end
  
end
