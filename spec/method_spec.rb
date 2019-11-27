require "./method.rb"

RSpec.describe Enumerable do
  ar1=[1,2,3,4,5,6,7,8,9]
  describe "#my_select" do
    it "should return the elements that passes the test" do
      expect(ar1.my_select{|x| x>3}).to eql([4,5,6,7,8,9])
    end
    it "should return the multiple of 3" do
      expect(ar1.my_select{|x| x%3==0}).to eql([3,6,9]) 
    end

    it "should return all the integer" do
      expect(ar1.my_select{|x| x.is_a?(Integer)}).to eql(ar1)
    end
  end

  describe "#my_all?" do
    it "should return false if the all the element are not greater than 5" do
      expect(ar1.my_all?{|x| x>5}).to eql(false)
    end

    it "should return true if the word in an array has 3 letters" do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    end

    it "should return true if the word in the array has a letter t" do
      expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
    end

    it "should return if all the elements in the array are numeric" do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
    end

    it "should return true if all the elements in the array return true" do 
      expect([nil, true, 99].my_all?).to eql(false)
    end

    it "should return if array is empty" do
      expect([].my_all?).to eql(true)
    end
  end

  describe "#my_any?" do
    it "should return true if the word in the array has 3 letters" do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
    end

    it "should return true if the word in the array has a letter d" do
      expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
    end

    it "should return if all the elements in the array are Integer" do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end

    it "should return true if all the elements in the array return true" do 
      expect([nil, true, 99].my_any?).to eql(true)
    end

    it "should return if array is empty" do
      expect([].my_any?).to eql(false)
    end
  end

  describe "#my_none?" do
    it "should return true if the word in the array has 3 letters" do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
    end

    it "should return true if the word in the array has a letter d" do
      expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
    end

    it "should return if all the elements in the array are Integer" do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end

    it "should return if array is empty" do
      expect([].my_none?).to eql(true)
    end
  end
end

