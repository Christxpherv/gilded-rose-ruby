class GildedRose
  # changed attr_reader to include name and item
  attr_reader :name, :item

  def initialize(name:, days_remaining:, quality:)
    @item = klass_for(name).new(quality, days_remaining)
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

  def klass_for(name)
    # removed functions and added cases that make instance of the class
    case name
    when "Normal Item"
      Normal
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Backstage
    end
  end

  # make a method that calls the tick method of the item
  def tick
    item.tick
  end

  # remove @quality and 'if item' since we will always create an item now
  def quality
    return item.quality
  end
  # remove @days_remaining and 'if item' since we will always create an item now
  def days_remaining
    return item.days_remaining
  end
end
