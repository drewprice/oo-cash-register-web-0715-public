class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @total    = 0
    @discount = discount
    @items    = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times { @items << item }

    @total += (price * quantity)
  end

  def apply_discount
    return 'There is no discount to apply.' if @discount == 0

    @total *= discount_formatted

    "After the discount, the total comes to $#{total_display}."
  end

  private

  def total_display
    @total.round == @total ? @total.round : @total
  end

  def discount_formatted
    1 - (20.fdiv(100))
  end
end
