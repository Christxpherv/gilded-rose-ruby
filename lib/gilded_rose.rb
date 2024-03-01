module GildedRose

  def self.new(name:, days_remaining:, quality:)
    klass_for(name).new(quality, days_remaining)
  end

  class Item
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

  end
  # create class for Normal
  class Normal < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end
  # create class for Brie
  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end
  # create class for Sulfuras
  class Sulfuras < Item
    def tick

    end
  end
  # created class for backstage
  class Backstage < Item
    def tick
      @days_remaining -= 1
      return              if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

  def self.klass_for(name)
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

  # def tick
  #   item.tick
  # end

  # def quality
  #   return item.quality
  # end

  # def days_remaining
  #   return item.days_remaining
  # end
end
