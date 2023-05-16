# frozen_string_literal: true

module Tax
  # Order class is responsible for holding all items and calculating the total tax and total price
  class Order
    attr_reader :items

    def initialize
      @items = []
    end

    def add(item)
      @items << item
    end

    def total
      @items.sum(&:total_price_after_tax).round(2).to_f
    end

    def tax
      @items.sum(&:total_tax)
    end

    def to_s
      @items.map(&:to_s).join("\n") + "\nSales Taxes: #{format("%.2f", tax)}\nTotal: #{total}\n"
    end
  end
end
