# frozen_string_literal: true

RSpec.describe Tax::Calculator do
  describe "#tax" do
    subject { calculator.tax }

    let(:calculator) { described_class.new(item: item) }

    context "when not imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 1, name: "book", price: "12.49") }

      it { is_expected.to eq(0) }
    end

    context "when not imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 1, name: "tv", price: "12.49") }

      it { is_expected.to eq(1.25) }
    end

    context "when imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 1, name: "imported book", price: "12.49") }

      it { is_expected.to eq(0.65) }
    end

    context "when imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 1, name: "imported tv", price: "13.14") }

      it { is_expected.to eq(2.0) }
    end
  end

  describe "#total_tax" do
    subject { calculator.total_tax }

    let(:calculator) { described_class.new(item: item) }

    context "when not imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 2, name: "book", price: "12.49") }

      it "multiplies by the quantity" do
        expect(subject).to eq(0)
      end
    end

    context "when not imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 2, name: "tv", price: "12.49") }

      it "multiplies by the quantity" do
        expect(subject).to eq(2.5)
      end
    end

    context "when imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 2, name: "imported book", price: "12.49") }

      it "multiplies by the quantity" do
        expect(subject).to eq(1.3)
      end
    end

    context "when imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 2, name: "imported chocolate", price: "13.14") }

      it "multiplies by the quantity" do
        expect(subject).to eq(1.4)
      end
    end
  end

  describe "#total_price_after_tax" do
    subject { calculator.total_price_after_tax }

    let(:calculator) { described_class.new(item: item) }

    context "when not imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 1, name: "book", price: "12.49") }

      it { is_expected.to eq(12.49) }
    end

    context "when not imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 1, name: "tv", price: "12.49") }

      it { is_expected.to eq(13.74) }
    end

    context "when imported and is exempt" do
      let(:item) { Tax::Item.new(quantity: 1, name: "imported book", price: "12.49") }

      it { is_expected.to eq(13.14) }
    end

    context "when imported and is taxable" do
      let(:item) { Tax::Item.new(quantity: 1, name: "imported tv", price: "13.14") }

      it { is_expected.to eq(15.14) }
    end
  end
end
