# frozen_string_literal: true

require "bigdecimal"
require "forwardable"
require_relative "calculator"

module Tax
  # Represents an item in an order
  class Item
    extend Forwardable

    attr_reader :name, :price, :quantity

    def_delegators :tax_calculator, :tax, :total_tax, :total_price_after_tax

    def initialize(quantity:, name:, price:)
      @quantity = quantity
      @name = name
      @price = BigDecimal(price)
    end

    def to_s
      "#{quantity} #{name}: #{format("%.2f", total_price_after_tax)}"
    end

    private

    def tax_calculator
      ::Tax::Calculator.new(item: self)
    end
  end
end
