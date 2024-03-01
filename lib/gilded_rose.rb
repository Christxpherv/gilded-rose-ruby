class GildedRose
  attr_reader :name, :item

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick

    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return              if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
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
    @item = Normal.new(@quality, @days_remaining)
    item.tick
  end

  # added brie_tick method
  def brie_tick
    @item = Brie.new(@quality, @days_remaining)
    item.tick
  end

  # make sulfuras_tick method
  def sulfuras_tick
    @item = Sulfuras.new(@quality, @days_remaining)
    item.tick
  end

  # make backstage_tick method
  def backstage_tick
    @item = Backstage.new(@quality, @days_remaining)
    item.tick
  end

  def quality
    return item.quality if item
    @quality
  end

  def days_remaining
    return item.days_remaining if item
    @days_remaining
  end
end
