class Item
    attr_reader :id, :price, :amount, :name, :image

    def initialize(item_hash)
        @id = item_hash['id']
        @price = item_hash['price']
        @amount = item_hash['amount']
        @name = item_hash['name']
        @image = item_hash['image']
    end
end
