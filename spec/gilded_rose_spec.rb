require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("+5 Dexterity Vest", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "+5 Dexterity Vest"
    end

    it "lowers the SellIn value by 1 at the end of each day" do
      items = [Item.new("+5 Dexterity Vest", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "lowers the Quality value by 1 at the end of each day" do
      items = [Item.new("+5 Dexterity Vest", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "degrades the Quality value twice as fast once the sell by date has passed" do
      items = [Item.new("+5 Dexterity Vest", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "does not lower the Quality value below 0" do
      items = [Item.new("+5 Dexterity Vest", 10, 10)]
      gilded_rose = GildedRose.new(items)
      15.times do
        gilded_rose.update_quality()
      end
      expect(items[0].quality).to eq 0
    end

    context "when the item is 'Aged Brie'" do
      it "increases in Quality the older it gets" do
        items = [Item.new("Aged Brie", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
      end

      it "never has a Quality value more than 50" do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "when the item is 'Sulfuras, Hand of Ragnaros'" do
      it "does not change the SellIn value" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
      end

      it "does not change the Quality value" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "when the item is 'Backstage passes to a TAFKAL80ETC concert'" do
    
      it "increases the Quality value by 1 when there are more than 10 days before the concert" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
      end

      it "increases the Quality value by 2 when there are 10 days or less before the concert" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
      end

      it "increases the Quality value by 3 when there are 5 days or less before the concert" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 13
      end

      it "drops the Quality value to 0 after the concert" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end


      it "never has a Quality value more than 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end

    end

    context "when the item is 'Conjured'" do
      it "degrades in Quality twice as fast as normal items" do
        items = [Item.new("Conjured Mana Cake", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
      end
    end

  end
end
