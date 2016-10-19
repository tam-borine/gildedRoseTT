require 'inverse_update'

describe InverseUpdate do

  attr_reader :item, :inverse_update

  before (:all) do
    @item = spy("item")
    @inverse_update = described_class.new(item)
  end

  it "quality of item is increased and sell_in decreased" do
    expect{inverse_update.update}.to change{item.sell_in}.by -1
    expect{inverse_update.update}.to change{item.quality}.by 1
  end
end
