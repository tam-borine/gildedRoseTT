class InverseUpdate


  def initialize(item)
    @item = item
  end

  def update
    @item.sell_in -= 1
    @item.quality += 3
  end
end
