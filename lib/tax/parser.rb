# frozen_string_literal: true

require_relative "order"
require_relative "item"
require_relative "line_parser"

module Tax
  # Parses input and returns an Order object
  class Parser
    def initialize(input)
      @input = input
    end

    def parse
      order = Order.new
      @input.each_line do |line|
        order.add(Item.new(**parse_line(line)))
      end
      order
    end

    private

    def parse_line(line)
      LineParser.new(line).parse
    end
  end
end
