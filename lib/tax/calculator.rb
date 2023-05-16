# frozen_string_literal: true

require "forwardable"

module Tax
  # Calculates tax for an item
  class Calculator
    APPLICABLE_TAX = 0.1
    IMPORT_TAX = 0.05
    TAX_FREE = %w[book chocolate pills].freeze

    extend Forwardable

    attr_reader :item

    def_delegators :@item, :name, :price, :quantity

    def initialize(item:)
      @item = item
    end

    def tax
      tax = 0
      tax += price * APPLICABLE_TAX unless tax_free?
      tax += price * IMPORT_TAX if imported?

      round_to_nearest_5_cents(tax)
    end

    def total_tax
      tax * quantity
    end

    def total_price_after_tax
      ((price + tax) * quantity).to_f.round(2)
    end

    private

    def tax_free?
      TAX_FREE.any? { |category| name.include?(category) }
    end

    def imported?
      name.include?("imported")
    end

    def round_to_nearest_5_cents(tax)
      ((tax * 20).ceil / 20.0)
    end
  end
end
