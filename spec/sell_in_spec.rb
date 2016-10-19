require 'spec_helper'
require 'sell_in'

describe SellIn do
    it "has defualt of 10 days" do
      expect(SellIn::DAYS).to be_kind_of Fixnum
    end

end
