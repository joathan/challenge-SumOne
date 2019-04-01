class DrinksController < ApplicationController
  before_action :select_all, only: %i[index]

  def index
  end

  def recommendation
    @drinks = Drink.search(drink_params).page params[:page]
    respond_to do |format|
        format.html
        format.js {render 'drinks/index'}
      end
  end

  private
    def select_all
        @drinks = Drink.all.order(:name).page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    end

    def drink_params
      params.permit(:name, :description, :image_url, :rating_avg, :alcohol_level, :ibu, :temperature, :base_ingredient, :origin, :drinkware, :distilled)
    end
end
