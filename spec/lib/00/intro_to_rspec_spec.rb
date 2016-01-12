# The 'spec_helper' files provides all the setup we need to run our specs
require 'spec_helper'

# Run these specs with `rspec spec/lib/00/intro_to_rspec_spec.rb` from the top level directory
# of this codebase.
#
RSpec.describe IntroToRspec do

  # We test each method in our class to ensure they are working as required.
  #
  # We wrap the tests for each method in a describe block so it is easier to navigate our
  # spec file. Many text editors will use the indentation in code folding, which makes
  # it easier to focus on a single method. This allow us to conserve focus while working on
  # our code.
  #
  # Additionally, it allows us to run all the specs for this individual method. RSpec provides
  # this in 3 ways that I know of:
  #   1. The -e flag, which accepts the name of the describe block. EG: `rspec this_file -e ".my_class_method"`
  #   2. The : flag, which accepts a line number. EG: "rspec this_file:<the line number that the describe block is on>"
  #   3. The :focus keyword, which can be added as an argument to the describe block. EG:
  #      `describe '.my_class_method', :focus do`
  #
  # We prefix the method name with a '.' for class methods, and a '#' for instance methods.
  #
  # All class method related code should go at the top of the file (in both the implementation
  # and the spec). This makes it easier for developers to find code in the class. Ideally,
  # your classes will be small and focussed enough to not even need this.
  #
  describe '.my_class_method' do
    # The subject declaration always goes at the top of the describe block. It is the most
    # important piece of information in the spec as it communicates to the developer what
    # exactly is being tested.
    #
    subject { IntroToRspec.my_class_method(argument) }
    # The let declarations belong below the subject block. If you have many let declarations I would
    # recommend you put a line of whitespace between them and the subject block. This improves
    # the visibility of the subject block.
    #
    # let blocks allow us to define variables that are important for our tests. In this case,
    # we store the argument we are passing to the .my_class_method method so it can be used
    # to assert that the method is working as expected.
    let(:argument) { "Jordan rules!" }

    # This is an assertion using an *implicit* subject.
    #
    # When you read it out loud "it should equal argument" the 'it' is our subject block.
    #
    # EG: "my_class_method should eq argument".
    # EG: "my_class_method should return 'Jordan rules!'"
    it { should eq(argument) }

    # You could also use an *explicit* subject. This just means that you manually call the
    # subject in the spec. This spec and the above are functionally identical:
    specify { expect(subject).to eq(argument) }

    # You can also provide a written description of the spec if you want to use specs as documentation
    # or when the spec is more than one line of code.
    it "should return the argument that is passed to it" do
      should eq(argument)
    end
  end

  describe '#my_instance_method' do
    subject { IntroToRspec.new.my_instance_method(argument) }

    # The `context` and `describe` blocks are actually aliases of eachother. They are completely
    # identical.
    #
    # The only difference is semantic - when we choose to use them.
    #
    # We use context blocks when the block represents a certain condition. They will generally
    # involve setting up data in a particular way.
    #
    # We use describe blocks to encapsulate a specific piece of functionality.
    #
    # It is possible to have describe blocks within context blocks. The inverse is also true.
    #
    # In this context block, I'm ensuring that the argument is 6 characters, to ensure that
    # the conditional in our implementation is working as expected.
    #
    # We use 6 characters *exactly*, not 7, not 100, not a randomly generated string. We want
    # to ensure *specifically* that 6 is the number of characters that causes the differing behaviour.
    #
    # If we tested using 100 characters, all we'd be proving is that some number between 6 and 100
    # would cause the returned result to change.
    context "when the argument passed is greater than 6 characters" do
      # let blocks defined *within* a context will not be available to specs outside the context.
      let(:argument) { "1234567" }
      it { should eq("tl;dr") }
    end

    context "when the argument passed is 6 characters" do
      let(:argument) { "123456" }
      it { should eq(argument) }
    end

    context "when the argument passed is fewer than 6 characters" do
      let(:argument) { "12345" }
      it { should eq(argument) }
    end
  end

end
