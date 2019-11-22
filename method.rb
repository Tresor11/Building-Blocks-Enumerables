# frozen_string_literal: true

module Enumerable
  def my_each(arr)
    result = []
    for i in 0...arr.length - 1
      result << yield(arr[i])
    end
    return result
  end
end
