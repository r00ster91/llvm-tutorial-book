require "spec"
require "../emerald/emerald"

# Note that these examples create program examples with:
#      EmeraldProgram.new input_code, true
# The true param forces program to re-raise exception instead of printing and exiting to allow tests to work as expected.

describe "Errors" do
	describe "Emerald error handling" do
		it "should catch bad combinations of tokens 1" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts ( * 2)", true
				program.compile
			end
		end

		it "should catch bad combinations of tokens 2" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts (2 *)", true
				program.compile
			end
		end

		it "should catch bad combinations of tokens 3" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts 2 * * 2", true
				program.compile
			end
		end
		
		it "should catch bad combinations of tokens 4" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts 2 ()", true
				program.compile
			end
		end

		it "should catch bad combinations of tokens 5" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts () 2", true
				program.compile
			end
		end

		it "should catch bad combinations of tokens 6" do
			expect_raises EmeraldTokenVerificationException do
				program = EmeraldProgram.new "puts 2 \"Int\"", true
				program.compile
			end
		end

		it "should cause value resolution errors for undefined operators on known type combinations" do
			expect_raises EmeraldValueResolutionException do
				program = EmeraldProgram.new "puts 1 += 1", true
				program.compile
			end
		end

		it "should cause value resolution errors for undefined type combinations" do
			expect_raises EmeraldValueResolutionException do
				program = EmeraldProgram.new "puts true + 1", true
				program.compile
			end
		end
	end
end
