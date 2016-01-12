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

end
