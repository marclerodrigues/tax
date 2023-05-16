# frozen_string_literal: true

RSpec.describe Tax::LineParser do
  describe "#parse" do
    subject(:result) { described_class.new(line).parse }

    context "when quantity is 1" do
      let(:line) { "1 music CD at 14.99" }

      it "returns the correct output" do
        expected_output = {
          quantity: 1,
          name: "music CD",
          price: BigDecimal("14.99")
        }

        expect(result).to eq(expected_output)
      end
    end

    context "when quantity is greater than 1" do
      let(:line) { "3 imported boxes of chocolates at 11.25" }

      it "returns the correct output" do
        expected_output = {
          quantity: 3,
          name: "imported boxes of chocolates",
          price: BigDecimal("11.25")
        }

        expect(result).to eq(expected_output)
      end
    end
  end
end
