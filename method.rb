# frozen_string_literal: true

module Enumerable
  def my_each(arr)
    result = []
    i = 0
    until i == arr.length
      res << yield(arr[i])
      i += 1
    end
end
end
