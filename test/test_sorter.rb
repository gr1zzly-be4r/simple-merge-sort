require 'minitest/autorun'
require_relative '../sorter'

class TestSorter < Minitest::Test

  def setup
    @sorter = Sorter.new
  end

  def test_sorter_sorts_positive_integer_array
    array = Array.new(100) { |i| if i < 2 then rand(3) else rand(i) end }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def test_sorter_sorts_negative_integer_array
    array = Array.new(100) { |i| if i < 2 then rand(3) * -1 else rand(i) * -1 end }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def test_sorter_sorts_positive_float_array
    array = Array.new(100) { |i| rand }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def test_sorter_sorts_negative_float_array
    array = Array.new(100) { |i| rand * -1 }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def test_sorter_sorts_pos_neg_float_array
    array = Array.new(100) { |i|
      if rand < 0.5
        rand
      else
        rand * -1
      end
    }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def test_sorter_sorts_pos_neg_integer_array
    array = Array.new(100){ |i|
      if rand < 0.5
        rand(100)
      else
        rand(100) * -1
      end
    }
    copy = array
    assert(array.sort, @sorter.m_sort(copy))
  end

  def brute_force_sort(array)
    array.each_with_index { |a, i|
      array.each_with_index { |b, j|
        if i < j then 
          if array[j] < array[i] then
            array[i] = array[j]
          end
        end
      }
    }
  end

  def test_m_sort_faster_than_brute_force
    array = Array.new(10000) { |i| rand(10000) }
    copy = array

    # Time the merge sort
    m_start = Time.now
    @sorter.m_sort array
    m_stop = Time.now

    # Time the bubble sort
    b_start = Time.now
    brute_force_sort copy
    b_stop = Time.now

    puts "Merge took #{m_stop - m_start} seconds."
    puts "Bubble took #{b_stop - b_start} seconds."

    assert((m_stop - m_start) < (b_stop - b_start))
  end

end
