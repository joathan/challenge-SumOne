module DrinkHelper

  def true_false
    %i[true false]
  end

  def distinct_base_ingredient
    DrinkService.new.distinct_base_ingredient
  end
end
