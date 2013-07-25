require 'test/unit'
require 'arrays'

class ArraysTest < Test::Unit::TestCase
  def test_head
    assert_equal(1, [1, 2, 3].head)
    assert_equal(nil, [].head)
  end

  def test_init
    assert_equal([1, 2], [1, 2, 3].init)
  end
  
  def test_tail
    assert_equal([2, 3], [1, 2, 3].tail)
  end
  
  def test_cluster
    assert_equal([[1], [2], [3]], [1, 2, 3].cluster { |a, b| a == b })
    assert_equal([[1], [2, 2, 2], [3]], [1, 2, 2, 2, 3].cluster { |a, b| a == b })
    assert_equal([[1, 1], [2, 2], [1]], [1, 1, 2, 2, 1].cluster { |a, b| a == b })
    assert_equal([[1]], [1].cluster { |a, b| a == b })
    assert_equal([], [].cluster { |a, b| a == b })
  end
end
