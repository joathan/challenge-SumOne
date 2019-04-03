require 'rails_helper'

RSpec.describe DrinkHelper, type: :helper do
  context "return methods" do
    it "return array [true, false]" do
      expect(helper.true_false).to eql([:true, :false])
    end

    it "return array" do
      expect(helper.distinct_base_ingredient).to eql([])
    end
  end
end
