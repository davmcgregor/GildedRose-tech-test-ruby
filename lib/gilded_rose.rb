require './lib/item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !is_brie?(item) && !is_backstage_passes?(item)
        if item.quality > 0
          if !is_sulfuras?(item)
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if is_backstage_passes?(item)
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      if !is_sulfuras?(item)
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        if !is_brie?(item)
          if !is_backstage_passes?(item)
            if item.quality > 0
              if !is_sulfuras?(item)
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
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