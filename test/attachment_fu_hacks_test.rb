require "../../../../test/test_helper"

class Photo < ActiveRecord::Base
  has_attachment :storage => :file_system, :thumbnails => {:small => "50x50"}
end

class AttachmentFuHacksTest < Test::Unit::TestCase
  # Replace this with your real tests.
  
  def setup
    @file_path = File.join(File.dirname(__FILE__),"basketball.jpg")
  end
  
  def test_should_respond_to_local_file
    assert_nothing_raised { Photo.new.local_file=(@file_path) }
  end
  
  def test_should_assign_different_attributes
    meths = [:filename, :content_type, :temp_path]
    a = Photo.new
    meths.each do |meth|
      assert a.send(meth).blank?
    end
    a.local_file= @file_path
    meths.each do |meth|
      assert !a.send(meth).blank?
    end
  end
  
  
end
