require 'pry'

class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = Hash.new(0)  #need 0 here to start ingredients with initial value
    @shopping_list = Hash.new(0)
    @cookbook = []
  end

  def stock_check(ingredient)
    stock[ingredient]
  end

  def restock(ingredient, amount)
    stock[ingredient] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, amount|
      shopping_list["#{ingredient}"] += amount
    end
  end

  def print_shopping_list
    result = ""
    if @shopping_list.length == 1
      puts "#{shopping_list.keys}: #{shopping_list.values}"
    elsif @shopping_list.length > 1
    print_shopping_list_greater_than_one_item(@shopping_list, result)
    end
  end

  def print_shopping_list_greater_than_one_item(shopping_list, result)
    @shopping_list.each do |ingredient, amount|
      result += "* #{ingredient}: #{amount}\n"
      end
    result
  end

  def add_to_cookbook(recipe)
   cookbook << recipe
  end

  def what_can_i_make
    cookbook.map do |recipe|
      matching_ingredients = 0
     recipe.ingredients.each do |ingredient|
      if stock.include?(ingredient)
         matching_ingredients += 1
       end
     end
      if matching_ingredients == recipe.ingredients.length
        recipe.name
      end
  end
end



    # ingredients = recipe.ingredients.keys
    # ingredients = 0
    # ingredients.each do |ingredient|
    #   ingredients += 1 if stock.keys.include?(ingredient)
    # end


    end
  end



end
