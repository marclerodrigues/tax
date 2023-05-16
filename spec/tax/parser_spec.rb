# frozen_string_literal: true

RSpec.describe Tax::Parser do
  describe "#parse" do
    describe "test case 1" do
      it "returns the correct output" do
        input = <<~INPUT
          2 book at 12.49
          1 music CD at 14.99
          1 chocolate bar at 0.85
        INPUT

        output = <<~OUTPUT
          2 book: 24.98
          1 music CD: 16.49
          1 chocolate bar: 0.85
          Sales Taxes: 1.50
          Total: 42.32
        OUTPUT

        expect(Tax::Parser.new(input).parse.to_s).to eq(output)
      end
    end

    describe "test case 2" do
      it "returns the correct output" do
        input = <<~INPUT
          1 imported box of chocolates at 10.00
          1 imported bottle of perfume at 47.50
        INPUT

        output = <<~OUTPUT
          1 imported box of chocolates: 10.50
          1 imported bottle of perfume: 54.65
          Sales Taxes: 7.65
          Total: 65.15
        OUTPUT

        expect(Tax::Parser.new(input).parse.to_s).to eq(output)
      end
    end

    describe "test case 3" do
      it "returns the correct output" do
        input = <<~INPUT
          1 imported bottle of perfume at 27.99
          1 bottle of perfume at 18.99
          1 packet of headache pills at 9.75
          3 imported boxes of chocolates at 11.25
        INPUT

        output = <<~OUTPUT
          1 imported bottle of perfume: 32.19
          1 bottle of perfume: 20.89
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 35.55
          Sales Taxes: 7.90
          Total: 98.38
        OUTPUT

        expect(Tax::Parser.new(input).parse.to_s).to eq(output)
      end
    end
  end
end
