class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    # create case statement to call the correct method
    case name
    when "Normal Item"
      return normal_tick
    when "Aged Brie"
      return brie_tick
    when "Sulfuras, Hand of Ragnaros"
      return sulfuras_tick
    when "Backstage passes to a TAFKAL80ETC concert"
      return backstage_tick
    end
  end

  # refactor the normal_tick method more
  def normal_tick
    @days_remaining -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end

  # added brie_tick method
  def brie_tick
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining <= 0 && @quality < 50
  end

  # make sulfuras_tick method
  def sulfuras_tick
  end

  # make backstage_tick method
  def backstage_tick
    @days_remaining -= 1
    return              if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
  end
end
