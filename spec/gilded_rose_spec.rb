require 'spec_helper'
require 'gilded_rose'

describe GildedRose do
  # items = [Item.new("foo", 0, 0)]



  describe "#update_quality" do
    it "does not change the name" do
      pending "this test is pending because it's legacy code"
      items[0].name.should == "fixme"
    end
  end

  describe "#item_exceptional?" do #still need to add Conjured
    attr_reader :items, :rose

    before (:each) do
      @items = object_double("items")
      @rose = GildedRose.new(items)
    end

    it "returns true if has exceptional updating rules" do
      item = ["Aged Brie", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert"].sample
      expect(rose.item_exceptional(item)).to eq true
    end

    it "returns false if item does not have exceptional updating rules" do
      item = ["Pork", "Rabbits", "Sunglasses"].sample
      expect(rose.item_exceptional(item)).to eq false
    end
  end



end
