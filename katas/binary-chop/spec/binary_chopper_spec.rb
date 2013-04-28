require 'spec_helper'
require 'binary_chopper'

shared_examples_for "binary chop" do
  context "and the search target exists in the collection" do
    it "returns the position of the search target" do
      expect(chop(1, [1])).to eq(0)

      expect(chop(1, [1, 3, 5])).to eq(0)
      expect(chop(3, [1, 3, 5])).to eq(1)
      expect(chop(5, [1, 3, 5])).to eq(2)

      expect(chop(1, [1, 3, 5, 7, 9, 11, 13, 15, 17])).to eq(0)
      expect(chop(3, [1, 3, 5, 7])).to eq(1)
      expect(chop(5, [1, 3, 5, 7])).to eq(2)
      expect(chop(7, [1, 3, 5, 7])).to eq(3)

      expect(chop(1,  [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(0)
      expect(chop(3,  [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(1)
      expect(chop(5,  [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(2)
      expect(chop(7,  [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(3)
      expect(chop(9,  [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(4)
      expect(chop(11, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(5)
      expect(chop(13, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(6)
      expect(chop(15, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(7)
      expect(chop(17, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(8)
      expect(chop(19, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(9)
      expect(chop(21, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(10)
      expect(chop(23, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(11)
    end

  end

  context "and the search target doesn't exist in the collection" do
    it "returns -1" do
      expect(chop(3, [])).to eq(-1)
      expect(chop(3, [1])).to eq(-1)

      expect(chop(0, [1, 3, 5])).to eq(-1)
      expect(chop(2, [1, 3, 5])).to eq(-1)
      expect(chop(4, [1, 3, 5])).to eq(-1)
      expect(chop(6, [1, 3, 5])).to eq(-1)

      expect(chop(0, [1, 3, 5, 7])).to eq(-1)
      expect(chop(2, [1, 3, 5, 7])).to eq(-1)
      expect(chop(4, [1, 3, 5, 7])).to eq(-1)
      expect(chop(6, [1, 3, 5, 7])).to eq(-1)
      expect(chop(8, [1, 3, 5, 7])).to eq(-1)

      expect(chop(8, [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23])).to eq(-1)
    end
  end
end

describe BinaryChopper::Iterative do
  include BinaryChopper::Iterative
  include_examples "binary chop"
end


describe BinaryChopper::Recursive do
  include BinaryChopper::Recursive
  include_examples "binary chop"
end

