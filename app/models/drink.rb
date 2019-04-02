# frozen_string_literal: true

class Drink < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :rating_avg, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :alcohol_level, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # Bitterness level
  validates :ibu, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  enum temperature: %i[
    hot
    warm
    ambient
    cold
    extra_cold
  ]

  def distinct_base_ingredient
    Drink.select('DISTINCT(base_ingredient)').order(:base_ingredient)
  end

  def self.search(params)
    if params[:name]
      where('lower(name) LIKE ?', "%#{params[:name].downcase}%").order(:name)
    else
      recommendation(params)
    end
  end

  private

  def self.recommendation(params)
    where("distilled = #{params[:distilled]}
      OR alcohol_level <= #{params[:alcohol_level]}
      OR ibu <= #{params[:ibu]}")
      .select("*, similarity(drinks.description, '#{params[:base_ingredient]}') as similarity")
      .order(params[:base_ingredient] ? 'similarity' : :rating_avg)
  end
end
