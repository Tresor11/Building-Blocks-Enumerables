# frozen_string_literal: true

module Enumerable
  def each(arr)
    result = []
    i = 0
    until i == arr.length
      result << yield(arr[i])
      i += 1
    end
  end

  def each_with_index(arr)
    result = []
    i = 0
    until i == arr.length
      result << yield(arr[i])
      i += 1
    end
  end

  def select(arr)
    result = []
    i = 0
    until i == arr.length
      if yield(arr[i])
        result << arr[i]
      end
    end
  end
end
