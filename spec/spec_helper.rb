# Load all the gems from our Gemfile (specifically, RSpec)
require 'bundler'
Bundler.require

# Require all the ruby files from our lib folder
#
# Explanation (Code):
#   * Dir.glob("./lib/**/*.rb") returns an array of all the files that end in .rb in any folder
#     within "./lib"
#   * &method(:require) is going to call the `require` method on each of those files. It is
#     a shorthand for `Dir.glob("./lib/**/*.rb") {|filepath| require(filepath)}.
#
Dir.glob("./lib/**/*.rb", &method(:require))
