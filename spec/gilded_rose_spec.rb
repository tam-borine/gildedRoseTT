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
      @brie = spy("brie", name: "brie")
      allow(rose).to receive(:exceptional_item_handler)
    end

    it "makes item modify itself for nonexceptional items" do
      rose.update(item)
      expect(item).to have_received (:sell_in)
      expect(item).to have_received (:quality)
    end

    it "calls exceptional_item_handler for exceptional items"do
      rose.update(brie)
      expect(rose).to have_received(:exceptional_item_handler)
    end

  end

  describe "#exceptional_item_handler" do
    attr_reader :brie
    before (:each) do
      @item = spy("item")
      @brie = spy("brie", name: "brie")
      # allow(rose).to receive(:exceptional_item_handler)
    end

    it "does not return falsyness because it selects handler class by name of item instantiates it and calls update" do

      expect(rose.send(:exceptional_item_handler, brie)).to be_truthy
    end
  end

  describe "#item_exceptional" do 
    it "returns true if has exceptional updating rules" do
      item = exceptionals_sample
      expect(rose.send(:item_exceptional, item)).to eq true
    end

    it "returns false if item does not have exceptional updating rules" do
      item = non_exceptionals_sample

      expect(rose.send(:item_exceptional, item)).to eq false
    end
  end



end
