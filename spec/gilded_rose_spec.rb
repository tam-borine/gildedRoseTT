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
      allow(rose).to receive(:init_exceptional_item_handler)
    end

    it "makes item modify itself for nonexceptional items" do
      rose.update(item)
      expect(item).to have_received (:sell_in)
      expect(item).to have_received (:quality)
    end

    it "calls init_exceptional_item_handler for exceptional items"do
      rose.update(brie)
      expect(rose).to have_received(:init_exceptional_item_handler)
    end

  end

  describe "#init_exceptional_item_handler" do
    attr_reader :brie
    before (:each) do
      @item = spy("item")
      @brie = spy("brie", name: "brie")
      # allow(rose).to receive(:init_exceptional_item_handler)
    end

    it "selects handler class by name of item and instantiates it" do
      brie_name = brie.name
      expect(rose.send(:init_exceptional_item_handler, brie_name)).to be_kind_of InverseUpdate
    end
  end

  describe "#item_exceptional" do #still need to add Conjured

    it "returns true if has exceptional updating rules" do
      item_name = exceptionals_sample
      expect(rose.send(:item_exceptional, item_name)).to eq true
    end

    it "returns false if item does not have exceptional updating rules" do
      item_name = non_exceptionals_sample
      expect(rose.send(:item_exceptional, item_name)).to eq false
    end
  end



end
