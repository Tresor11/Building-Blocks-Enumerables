# frozen_string_literal: true

module Enumerable
  def my_each
    if block_given?
      i = 0
      while i < self.size
        yield self[i]
        i += 1
      end
      self
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < self.size
        yield(self[i], i)
        i += 1
      end
      self
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      arr = []
      self.my_each do |x|
        if yield(x)
          arr << x
        end
      end
      arr
    else
      to_enum(:my_select)
    end
  end

  def my_all?(pattern = nil)
    if block_given?
      self.my_each do |x|
        return false unless yield(x)
      end
    elsif !pattern.nil?
      if pattern.is_a?(Class)
        self.my_each do |x|
          return false unless x.is_a?(pattern)
        end
      elsif pattern.is_a?(Regexp)
        self.my_each do |x|
          return false unless pattern.match(x.to_s)
        end
      else
        self.my_each do |x|
          return false unless x == pattern
        end
      end
    else
      self.my_each do |x|
        return false unless x
      end
    end
    true
  end

  def my_any?(patter = nil)
    if block_given?
      self.my_each do |x|
        return true if yield(x)
      end
    elsif !patter.nil?
      if patter.is_a?(Class)
        self.my_each do |x|
          return true if x.is_a?(patter)
        end
      elsif patter.is_a?(Regexp)
        self.my_each do |x|
          return true if patter.match(x.to_s)
        end
      else
        self.my_each do |x|
          return true if x == patter
        end
      end
    else
      self.my_each do |x|
        return true if x
      end
    end
    false
  end

  def my_none?(pat = nil)
    if block_given?
      self.my_each do |x|
        return false if yield(x)
      end
    elsif !pat.nil?
      if pat.is_a?(Class)
        self.my_each do |x|
          return false if x.is_a?(pat)
        end
      elsif pat.is_a?(Regexp)
        self.my_each do |x|
          return false if pat.match(x.to_s)
        end
      else
        self.my_each do |x|
          return false if x == pat
        end
      end
    else
      self.my_each do |x|
        return false if x
      end
    end
    true
  end

  def my_count(element = nil)
    total = 0
    if block_given?
      self.my_each do |x|
        total += 1 if yield(x)
      end
    elsif !element.nil?
      self.my_each do |x|
        total += 1 if x == element
      end
    else
      total = self.size
    end
    total
  end

  def my_map
    if block_given?
      arr = []
      if proc.nil?
        self.my_each { |x| arr << yield(x) }
      else
        self.my_each { |x| arr << proc.call(x) }
      end
      arr
    else
      to_enum(:my_map)
    end
  end

  def my_inject(init = nil, sym = nil)
    i = 1
    if init.nil?
      init = self[0]
      i = 1
    end
    if init && sym.nil?
      if init.class == Symbol
        symbol = init
        init = self[0]
        i = 1
        while i < self.size
          init = self[i].method(symbol).call(init)
          i += 1
        end
      elsif init.class == Integer
        while i < self.size
          init = yield(init, self[i])
          i += 1
        end
      end
    elsif init && sym
      i = 0
      while i < self.size
        init = self[i].method(sym).call(init)
        i += 1
      end
    elsif !init && !sym
      raise ArgumentError, 'Incorrect arguments provided'
    else
      init = self[0]
      i = 1
      while i < self.size
        init = yield(init, self[i])
        i += 1
      end
    end
    init
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end
