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

end
