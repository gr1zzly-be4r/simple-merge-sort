# Simple merge sorting algorithm
require_relative 'xy_point'
class Sorter
  
  def initialize
  end

  def m_sort(array)
    
    if array.nil? then return end

    length = array.length
    if length < 2 then return end
    
    midpoint = length / 2
    # Split up the arrays
    left_array = length.even? ? array.slice(0..(midpoint - 1)) : array.slice(0..midpoint)
    right_array = length.even? ? array.slice(midpoint..length) : array.slice((midpoint + 1)..length)

    m_sort(left_array)
    m_sort(right_array)
    helper(left_array, right_array, array, left_array.length, right_array.length)

  end

  def helper(left, right, array, left_length, right_length)
    left_i = 0
    right_i = 0
    sorted_i = 0

    while (left_i < left_length && right_i < right_length) do
      if (left[left_i] < right[right_i])
        array[sorted_i] = left[left_i]
        left_i += 1
        sorted_i += 1
      else
        array[sorted_i] = right[right_i]
        right_i += 1
        sorted_i += 1
      end
    end

    # Take care of the residual stuff
    while (left_i < left_length) do
      array[sorted_i] = left[left_i]
      left_i += 1
      sorted_i += 1
    end
    while (right_i < right_length) do
      array[sorted_i] = right[right_i]
      right_i += 1
      sorted_i += 1
    end

  end

  def xy_m_sort(array)

    if array.nil? then return end

    length = array.length
    if length < 2 then return end

    midpoint = length / 2
    # Split up the arrays
    left_array = length.even? ? array.slice(0..(midpoint - 1)) : array.slice(0..midpoint)
    right_array = length.even? ? array.slice(midpoint..length) : array.slice((midpoint + 1)..length)

    xy_m_sort(left_array)
    xy_m_sort(right_array)
    xy_helper(left_array, right_array, array, left_array.length, right_array.length)

  end

  def xy_helper(left, right, array, left_length, right_length)
    
    left_i = 0
    right_i = 0
    sorted_i = 0

    while (left_i < left_length && right_i < right_length) do
      if (left[left_i].compare(right[right_i]))
        array[sorted_i] = left[left_i]
        left_i += 1
        sorted_i += 1
      else
        array[sorted_i] = right[right_i]
        right_i += 1
        sorted_i += 1
      end
    end

    # Take care of the residual stuff
    while (left_i < left_length) do
      array[sorted_i] = left[left_i]
      left_i += 1
      sorted_i += 1
    end
    while (right_i < right_length) do
      array[sorted_i] = right[right_i]
      right_i += 1
      sorted_i += 1
    end


  end
end

