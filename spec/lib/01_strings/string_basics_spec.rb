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

  describe "#delete_test" do
    subject { string_basics.delete_test(original_string, characters_to_delete) }
    preamble("Use String#delete to remove characters from a string")

    let(:original_string) { "JORDAN RULES YO" }

    describe "deletes characters with matching case" do
      let(:characters_to_delete) { "RULES" }
      it { should eq("JORDAN  YO") }
    end

    describe "doesn't delete characters where case differs" do
      let(:characters_to_delete) { "rules" }
      it { should eq("JORDAN RULES YO") }
    end

    describe "deletes all instances of the character" do
      let(:characters_to_delete) { "O" }
      it { should eq("JRDAN RULES Y") }
    end
  end

  describe "#empty_test" do
    subject { string_basics.empty_test(string) }
    preamble("Use String#empty? to determine whether there are any characters in a string")

    describe "is false if there are alpha characters in the string" do
      let(:characters_to_delete) { "A" }
      it { should be_falsey }
    end

    describe "is false if there are numbers in the string" do
      let(:characters_to_delete) { "666" }
      it { should be_falsey }
    end

    describe "is false if there is just whitespace in the string" do
      let(:characters_to_delete) { " " }
      it { should be_falsey }
    end

    describe "is true if there is nothing in the string" do
      let(:characters_to_delete) { "" }
      it { should be_truthy }
    end
  end

  describe "#gsub_test" do
    subject { string_basics.gsub_test(original_string, pattern, replace_with) }
    preamble("Use String#gsub to replace patterns in a given string with another string")

    let(:original_string) { "JORDAN RULES rules" }
    let(:replace_with)    { "buffalo"}

    describe "can replace a string with another string" do
      let(:pattern) { "JORDAN" }
      it { should eq("buffalo RULES rules") }
    end

    describe "can replace a string with a regex" do
      let(:pattern) { /RULES/ }
      it { should eq("JORDAN buffalo rules") }
    end

    describe "can replace a string with a case insensitive regex" do
      let(:pattern) { /JORDAN/i }
      it { should eq("JORDAN buffalo buffalo") }
    end
  end

  # TODO
  # - include?
  # - index
  # - ljust
  # - lstrip
  # - prepend
  # - reverse
  # - rindex
  # - rjust
  # - rstrip
  # - scan
  # - slice
  # - split
  # - squeeze
  # - strip
  # - sub
  # - upcase

end
