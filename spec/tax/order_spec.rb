# frozen_string_literal: true

RSpec.describe Tax::Order do
  describe "#initialize" do
    it "initializes with an empty array" do
      order = described_class.new
      expect(order.items).to eq([])
    end
  end

  describe "#add" do
    it "adds an item to the order" do
      order = described_class.new
      item = instance_double(Tax::Item)
      order.add(item)
      expect(order.items).to eq([item])
    end

    it "adds multiple items to the order" do
      order = described_class.new
      item1 = instance_double(Tax::Item)
      item2 = instance_double(Tax::Item)
      order.add(item1)
      order.add(item2)
      expect(order.items).to eq([item1, item2])
    end
  end

  describe "#total" do
    it "returns the total price of the order" do
      order = described_class.new
      item1 = instance_double(Tax::Item, total_price_after_tax: 10)
      item2 = instance_double(Tax::Item, total_price_after_tax: 20)
      order.add(item1)
      order.add(item2)
      expect(order.total).to eq(30)
    end
  end

  describe "#tax" do
    it "returns the total tax of the order" do
      order = described_class.new
      item1 = instance_double(Tax::Item, total_tax: 1)
      item2 = instance_double(Tax::Item, total_tax: 2)
      order.add(item1)
      order.add(item2)
      expect(order.tax).to eq(3)
    end
  end

  describe "#to_s" do
    it "returns a string representation of the order" do
      order = described_class.new
      item1 = instance_double(Tax::Item, to_s: "item1")
      item2 = instance_double(Tax::Item, to_s: "item2")
      allow(order).to receive(:total).and_return(10)
      allow(order).to receive(:tax).and_return(1)
      order.add(item1)
      order.add(item2)
      expected_output = <<~OUTPUT
        item1
        item2
        Sales Taxes: 1.00
        Total: 10
      OUTPUT
      expect(order.to_s).to eq(expected_output)
    end
  end
end
