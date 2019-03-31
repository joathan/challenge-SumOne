class DrinksController < ApplicationController
  before_action :select_all, only: %i[index]

  def index
  end

  private
    def select_all
      @drinks = Drink.all.order(:name).page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
    end
end
