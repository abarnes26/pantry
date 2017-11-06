require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_instantiates
    assert_instance_of Pantry, Pantry.new
  end

  def test_pantry_has_a_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_the_stock_has_values
    pantry = Pantry.new
    results = pantry.stock_check("Cheese")

    assert_equal 0, results
  end

  def test_the_pantry_can_be_restocked
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    results = pantry.stock_check("Cheese")

    assert_equal 10, results
  end

  def test_the_same_item_can_be_restocked_mulitiple_times
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)
    results = pantry.stock_check("Cheese")

    assert_equal 30, results
  end

  def test_pantry_has_a_shopping_list_that_starts_empty
    pantry = Pantry.new
    results = pantry.shopping_list

    assert_equal ({}), results
  end

  def test_the_shopping_list_can_be_added_to
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 1500)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
    pantry.add_to_shopping_list(r)

    assert_equal ({"Cheese" => 1500, "Flour" => 500}), pantry.shopping_list
  end


end
