require "spec"
require "../emerald/emerald"

describe "Functions" do
  system "./emeraldc test_inputs/input9.cr -e > test_outputs/output9"
  contents = File.read("test_outputs/output9")

  it "should resolve final output as expected" do
    contents.should eq "9\n0\n"
  end
end
