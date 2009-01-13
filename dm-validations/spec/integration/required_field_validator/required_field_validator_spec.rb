require 'pathname'
__dir__ = Pathname(__FILE__).dirname.expand_path

require __dir__.parent.parent + 'spec_helper'
require __dir__ + 'spec_helper'

if HAS_SQLITE3 || HAS_MYSQL || HAS_POSTGRES
  describe "Resources" do  
    it "should validate the presence of a property value on an instance of a resource" do
      garden = Garden.new
      garden.should_not be_valid_for_property_test
      garden.errors.on(:name).should include('Name must not be blank')
  
      garden.name = 'The Wilds'
      garden.should be_valid_for_property_test
    end
  
    it "should validate the presence of an association value on an instance of a resource when dirty"
  
    it "should pass when a default is available" do
      fert = Fertilizer.new
      fert.should be_valid_for_property_test
    end
  end
end