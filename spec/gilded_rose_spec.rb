require 'spec_helper'
require 'gilded_rose'
require 'item'

describe GildedRose do
  # items = [Item.new("foo", 0, 0)]
  attr_reader :items, :rose

  before (:all) do
    include Helpers
    @items = object_double("items")
    @rose = GildedRose.new(items)
  end


  describe "#update" do

    attr_accessor :item, :brie

    before (:each) do
      @item = spy("item")
      @brie = spy("brie")
      allow(rose).to receive(:update_exceptional_item)
    end

    it "makes item modify itself for nonexceptional items" do
      rose.update(item)
      expect(item).to have_received (:sell_in)
      expect(item).to have_received (:quality)
    end

    it "calls update_exceptional_item for exceptional items"do
      rose.update(brie)
      expect(rose).to have_received(:update_exceptional_item)
    end
  end

  describe "#update_quality" do
    it "does not change the name" do
      pending "this test is pending because it's legacy code"
      items[0].name.should == "fixme"
    end
  end

  describe "#item_exceptional?" do #still need to add Conjured

    it "returns true if has exceptional updating rules" do
      item = exceptionals_sample
      expect(rose.item_exceptional(item)).to eq true
    end

    it "returns false if item does not have exceptional updating rules" do
      item = non_exceptionals_sample
      expect(rose.item_exceptional(item)).to eq false
    end
  end



end
