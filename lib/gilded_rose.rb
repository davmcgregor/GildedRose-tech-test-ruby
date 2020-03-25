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
        if item.quality > MIN_QUALITY
          if !is_sulfuras?(item)
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < MAX_QUALITY
          item.quality = item.quality + 1
          if is_backstage_passes?(item)
            if item.sell_in < PASSES_THRESHOLD_ONE
              if item.quality < MAX_QUALITY
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < PASSES_THRESHOLD_TWO
              if item.quality < MAX_QUALITY
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      if !is_sulfuras?(item)
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < MIN_QUALITY
        if !is_brie?(item)
          if !is_backstage_passes?(item)
            if item.quality > MIN_QUALITY
              if !is_sulfuras?(item)
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < MAX_QUALITY
            item.quality = item.quality + 1
          end
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
  
end