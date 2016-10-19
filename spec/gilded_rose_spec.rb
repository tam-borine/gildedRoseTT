require 'spec_helper'
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      pending "this test is pending because it's legacy code"
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      items[0].name.should == "fixme"
    end
  end

end
