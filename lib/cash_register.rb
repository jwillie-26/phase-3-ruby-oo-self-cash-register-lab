require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :former_total

    def initialize(discount = 0, total = 0, items = [])
        @total = total
        @discount = discount
        @items = items
    end

    def add_item(title, price, quantity=1)
        self.former_total = self.total
        self.total += (price * quantity)
        while quantity > 0
            self.items << title
            quantity -= 1
        end
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.total * (self.discount/100.to_f)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.former_total
        self.items.pop
    end
end