require 'inverse_update'

describe InverseUpdate do

  attr_reader :item, :inverse_update

  before (:each) do
    @item = spy("item")
    @inverse_update = described_class.new(item)
  end

  it "items sell_in and quality are modified by update" do
    inverse_update.update
    expect(item).to have_received :sell_in
    expect(item).to have_received :quality
  end
end
