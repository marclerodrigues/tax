# frozen_string_literal: true

module Tax
  # This class is responsible for parsing a line of input and returning a hash with all properties
  class LineParser
    attr_reader :line

    def initialize(line)
      @line = line
    end

    def parse
      quantity, name, price = line.match(/(\d+) (.+) at (\d+\.\d+)/).captures

      {
        quantity: quantity.to_i,
        name: name,
        price: BigDecimal(price)
      }
    end
  end
end
