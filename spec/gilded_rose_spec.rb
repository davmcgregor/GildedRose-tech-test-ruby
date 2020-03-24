require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("test_item", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "test_item"
    end

    it "lowers the SellIn value by 1 at the end of each day" do
      items = [Item.new("test_item", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "lowers the Quality value by 1 at the end of each day" do
      items = [Item.new("test_item", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "degrades the Quality value twice as fast once the sell by date has passed" do
      items = [Item.new("test_item", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "does not lower the Quality value below 0" do
      items = [Item.new("test_item", 10, 10)]
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
  end
end
