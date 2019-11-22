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
end
