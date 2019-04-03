require 'rails_helper'
require './app/services/drink_service'


RSpec.describe DrinkService, type: :service do

  context "return methods" do
    it "search" do
      expect(DrinkService.new).to respond_to(:search)
    end

    it "recommendation" do
      expect(DrinkService.new).to respond_to(:recommendation)
    end
  end
end
