# frozen_string_literal: true

RSpec.describe Tax::Item do
  describe "#to_s" do
    subject { item.to_s }

    context "when not imported and is exempt" do
      let(:item) { described_class.new(quantity: 1, name: "book", price: "12.49") }

      it { is_expected.to eq("1 book: 12.49") }
    end

    context "when not imported and is taxable" do
      let(:item) { described_class.new(quantity: 1, name: "tv", price: "12.49") }

      it { is_expected.to eq("1 tv: 13.74") }
    end

    context "when imported and is exempt" do
      let(:item) { described_class.new(quantity: 1, name: "imported book", price: "12.49") }

      it { is_expected.to eq("1 imported book: 13.14") }
    end

    context "when imported and is taxable" do
      let(:item) { described_class.new(quantity: 1, name: "imported tv", price: "13.14") }

      it { is_expected.to eq("1 imported tv: 15.14") }
    end
  end
end
