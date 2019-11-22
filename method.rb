# frozen_string_literal: true

module Enumerable
  def my_each(arr)
    result = []
    i = 0
    until i == arr.length
      result << yield(arr[i])
      i += 1
    end
    result
  end

  def my_each_with_index(arr)
    result = []
    i = 0
    until i == arr.length
      result << yield(arr[i], i)
      i += 1
    end
    result
  end

  def my_select(arr)
    result = []
    i = 0
    until i === arr.length
      if yield(arr[i])
        result << arr[i]
      end
      i += 1
    end
    result
  end

  def my_all(arr)
    cond = true
    i = 0
    until i == arr.length
      unless yield(arr[i])
        cond = false
      end
      i += 1
    end
    cond
  end

  def my_any(arr)
    cond = false
    i = 0
    until i == arr.length
      if yield(arr[i])
        cond = true
      end
      i += 1
    end
    cond
  end

  def my_none(arr)
    cond = true
    i = 0
    until i == arr.length
      if yield(arr[i])
        cond = false
      end
      i += 1
    end
    cond
  end

  def my_count(arr)
    count = 0
    i = 0
    until i == arr.length
      if yield(arr[i])
        count += 1
      end
      i += 1
    end
    count
  end

  def my_map(arr)
    result = []
    i = 0
    until i === arr.length
      result << yield(arr[i])
      i += 1
    end
    result
  end

  def my_inject(arr)
    result = arr[0]
    i = 1
    until i === arr.length
      result = yield(result, arr[i])
      i += 1
    end
    result
  end

  def multiply_els(arr)
    my_inject(arr) do |x, y|
      x * y
    end
  end

  def my_map2(arr, pro)
    result = []
    i = 0
    until i === arr.length
      result << pro.call(arr[i])
      i += 1
    end
    result
  end

  def my_map3(array, prc = nil)
    result = []

    i = 0
    while i < array.length

      if block_given?
        yield(array[i])
      else
        result << prc.call(array[i])
      end

      i += 1

    end

    result
  end
end
