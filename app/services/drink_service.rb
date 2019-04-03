class DrinkService

  def distinct_base_ingredient
    Drink.distinct(:base_ingredient).order(:base_ingredient).pluck(:base_ingredient)
  end

  def search(params)
    if params[:name]
      Drink.where("lower(name) LIKE ?", "%#{params[:name].downcase}%").order(:name)
    else
      recommendation(params)
    end
  end

  def recommendation(params)
    Drink
      .select("*, similarity(drinks.description, '#{params[:base_ingredient]}') as similarity")
      .where("distilled = ? OR alcohol_level <= ? OR ibu <= ?",
        params[:distilled], params[:alcohol_level], params[:ibu])
      .order(params[:base_ingredient] ? 'similarity' : :rating_avg)
  end
end
