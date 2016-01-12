require 'spec_helper'

describe StringBasics do

  let(:string_basics) { StringBasics.new }

  describe "#capitalize_test" do
    subject { string_basics.capitalize_test(string) }
    preamble("Use String#capitalize to capitalize only the first letter in a string")

    describe "capitalizing a single word" do
      let(:string) { "JORDAN" }
      it { should eq("Jordan") }
    end

    describe "capitalizing multiple words" do
      let(:string) { "JORDAN RULES" }
      it { should eq("Jordan rules") }
    end
  end

  describe "#concat_test" do
    subject { string_basics.concat_test("Jordan", "Rules") }
    preamble("Use String#concat to merge two strings together")

    it { should eq("JordanRules") }
  end

  describe "#count_test" do
    subject { string_basics.count_test(string) }
    preamble("Use String#count to return the count of characters in a string")

    describe "counting a single word" do
      let(:string) { "JORDAN" }
      it { should eq(6) }
    end

    describe "counting multiple words" do
      let(:string) { "JORDAN RULES" }
      # This includes whitespace
      it { should eq(6 + 1 + 5) }
    end
  end

end
