require_relative './inverse_update.rb'
class GildedRose
  def initialize(items)
    @items = items
  end

  def item_exceptional(item_name)
    exceptionals = ["brie", "Conjurer", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert"]
    exceptionals.include?(item_name)
  end

  def update(item)
    item_name = item.name
    if self.item_exceptional(item_name)
      self.init_exceptional_item_handler(item_name)
    else
    item.sell_in -= 1
    item.quality -= 1
    end
  end

  EXCEPTIONAL_ITEMS = {"brie" => InverseUpdate, "backstage_pass" => InverseUpdate }

  def init_exceptional_item_handler(item_name)
    EXCEPTIONAL_ITEMS[item_name].new
  end


  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
