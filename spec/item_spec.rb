require 'spec_helper'
require 'item'

describe Item do

  describe "#to_s" do
    it "shows initialized attributes in a string" do
      item = Item.new("SomeName", 5, 20)
      name = item.name
      sell_in = item.sell_in.to_s
      quality = item.quality.to_s
      expect(item.to_s).to include name, sell_in, quality
    end
  end

end
