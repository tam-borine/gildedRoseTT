module Helpers
  def exceptionals_sample
    exceptional_spies.sample
  end

  def non_exceptionals_sample
    non_exceptional_spies.sample
  end

  def exceptional_spies
    name =  ["brie", "sulfuras", "backstage_pass", "conjurer"].sample
    [spy("#{name}", methods_for_spies(name)), spy("#{name}", methods_for_spies(name)), spy("#{name}", methods_for_spies(name))]
  end

  def non_exceptional_spies
    name = ["Pork", "Rabbits", "Sunglasses"].sample
    [spy("#{name}", methods_for_spies(name)), spy("#{name}", methods_for_spies(name)), spy("#{name}", methods_for_spies(name))]
  end

  def methods_for_spies(name)
    {name: "#{name}", sell_in: 10, quality: 25}
  end
end
