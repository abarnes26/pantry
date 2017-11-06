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
end
