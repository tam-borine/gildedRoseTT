require_relative './inverse_update.rb'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update(item)
    if item_exceptional(item)
      exceptional_item_handler(item)
    else
    item.sell_in -= 1
    item.quality -= 1
    end
  end

  private

  attr_reader :item_exceptional, :exceptional_item_handler

  EXCEPTIONAL_ITEMS = {"brie" => InverseUpdate, "backstage_pass" => InverseUpdate }

  def item_exceptional(item)
    exceptionals = ["brie", "sulfuras", "backstage_pass", "conjurer"]
    exceptionals.include?(item.name)
  end

  def exceptional_item_handler(item)
    EXCEPTIONAL_ITEMS[item.name].new(item).update
  end

end
