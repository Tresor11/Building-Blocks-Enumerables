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
  end
end

