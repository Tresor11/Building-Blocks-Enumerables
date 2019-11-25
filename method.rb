# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i += 1
    end
    self
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
  end
    self
  end

  def my_all?(pattern = nil)
    if block_given?
      self.my_each do |x|
        return false unless yield(x)
      end
    elsif pattern != nil
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
    elsif patter != nil
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
    elsif pat != nil
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
    elsif element != nil
      self.my_each do |x|
        total += 1 if x == element
      end
    else
      total = self.size
      end
    total
    end

    def my_map
      arr=[]
      if proc.nil?
        self.my_each{|x| arr << yield(x)}
      else 
        self.my_each{|x| arr << proc.call(x)}
        end
        arr
    end
end

ar = [9, 9, 9, 9, 9, 9, 9, 9, 9]
fello=Proc.new{|x| x*2}
p ar.my_map.fell

# def my_each_with_index
#   i = 0
#   while i < self.length
#     yield(self[i], i)
#     i += 1
#   end
#   self
# end

# def my_all(pattern = nil)
#   if block_given?
#     my_each { |x|
#       return false unless yield x
#     }
#   elsif !pattern.nil?
#     if pattern.is_a?(Regexp)
#       my_each { |x|
#         return false unless pattern.match(x.to_s)
#       }
#     else
#       my_each { |x|
#         return false unless x.is_a?(pattern)
#       }
#     end
#   else
#     my_each { |x|
#       return false unless x
#     }
#   end
#   true
# end

# def my_injection(arg = nil)
#   start = nil
#   if arg.nil?
#     arg = self[0]
#     start = 1
#   else
#     start = 0
#   end
#   for i in start...self.size do
#     arg = yield(arg, self[i])
#   end
#   arg
# end
