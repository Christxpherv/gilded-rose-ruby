class GildedRose
  # changed attr_reader to include name and item
  attr_reader :name, :item

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end
  # create class for Normal
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
  # create class for Brie
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
  # create class for Sulfuras
  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick

    end
  end
  # created class for backstage
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
    # removed functions and added cases that make instance of the class
    case name
    when "Normal Item"
      @item = Normal.new(@quality, @days_remaining)
      item.tick
    when "Aged Brie"
      @item = Brie.new(@quality, @days_remaining)
      item.tick
    when "Sulfuras, Hand of Ragnaros"
      @item = Sulfuras.new(@quality, @days_remaining)
      item.tick
    when "Backstage passes to a TAFKAL80ETC concert"
      @item = Backstage.new(@quality, @days_remaining)
      item.tick
    end
  end

  # create quality getter
  def quality
    return item.quality if item
    @quality
  end
  # create days_remaining getter
  def days_remaining
    return item.days_remaining if item
    @days_remaining
  end
end
