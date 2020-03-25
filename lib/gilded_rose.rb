require './lib/item'

class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0
  PASSES_THRESHOLD_ONE = 11
  PASSES_THRESHOLD_TWO = 6
  
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !is_brie?(item) && !is_backstage_passes?(item)
        change_quality(item, -1) unless is_sulfuras?(item)
      else
        change_quality(item, 1)
        if is_backstage_passes?(item)
          if item.sell_in < PASSES_THRESHOLD_ONE
            change_quality(item, 1) 
          end
          if item.sell_in < PASSES_THRESHOLD_TWO
            change_quality(item, 1) 
          end
        end
      end

      change_sellin(item, -1) unless is_sulfuras?(item)

      if expired?(item)
        if !is_brie?(item)
          if !is_backstage_passes?(item)
            change_quality(item, -1) unless is_sulfuras?(item)
          else
            item.quality = item.quality - item.quality
          end
        else
          change_quality(item, 1) 
        end
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

  def change_quality(item, value)
    if quality_in_range?(item)
      item.quality += value
    end
  end

  def quality_in_range?(item)
    item.quality > MIN_QUALITY && item.quality < MAX_QUALITY
  end

  def expired?(item)
    item.sell_in < 0
  end

  def change_sellin(item, value)
    item.sell_in += value
  end
  
end