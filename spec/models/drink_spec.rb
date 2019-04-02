require 'rails_helper'

describe Drink do
  subject(&method(:drink))

  let(:drink) { FactoryBot.build :drink }
  describe 'validation successful' do

    it { expect { drink.name = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.description = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.image_url = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.rating_avg = 6 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.alcohol_level = -1 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.ibu = 11 }.to change { drink.valid? }.from(true).to(false) }
  end

  describe 'when testing the search method' do
    it 'an object of the Drink type must be retuned' do
      expect {drink.search({name: drink.name}).to eq(drink)}
    end
  end

  describe 'when testing the recommendation method' do
    it 'an object of the Drink type must be retuned' do
      expect {drink.recommendation({name: drink.name}).to eq(drink)}
    end
    it 'one or more Drink objects must be retuned' do
      expect {drink.recommendation({alcohol_level: drink.alcohol_level}).to eq(drink)}
    end

  end
end
