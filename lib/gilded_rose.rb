require './lib/item'

class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0
  PASSES_THRESHOLD_ONE = 11
  PASSES_THRESHOLD_TWO = 6
  
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      change_sell_in(item, -1) unless is_sulfuras?(item)
      change_quality(item, - 1) unless is_special?(item)

      if is_special?(item)
        change_quality(item, -2) if is_conjured?(item)
        change_quality(item, 1) if is_brie?(item) && item.quality < MAX_QUALITY
        change_quality(item, 1) if is_backstage_passes?(item) 
        change_quality(item, 1) if is_backstage_passes?(item) && item.sell_in < PASSES_THRESHOLD_ONE
        change_quality(item, 1) if is_backstage_passes?(item) && item.sell_in < PASSES_THRESHOLD_TWO
      end
      
      if expired?(item)
        change_quality(item, -1) unless is_special?(item)
        change_quality(item, -2) if is_conjured?(item)
        item.quality = MIN_QUALITY if is_backstage_passes?(item)
      end
    end
  end

  private

  def is_brie?(item)
    item.name == "Aged Brie"
  end

  def is_backstage_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_conjured?(item)
    item.name == "Conjured Mana Cake"
  end

  def is_special?(item)
    is_brie?(item) || is_backstage_passes?(item) || is_sulfuras?(item) || is_conjured?(item)
  end

  def change_quality(item, value)
    if quality_in_range?(item) || is_brie?(item)
      item.quality += value
    end
  end

  def quality_in_range?(item)
    item.quality > MIN_QUALITY && item.quality < MAX_QUALITY
  end

  def expired?(item)
    item.sell_in <= 0
  end

  def change_sell_in(item, value)
    item.sell_in += value
  end

end