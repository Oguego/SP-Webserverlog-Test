require './lib/parser'
require 'spec_helper'

describe Parser do

	describe "#ensure unique url" do
		it "returns total array count" do
			parser = Parser.new
			array = parser.process_unique_file_url("./lib/webserver.log")
			expect(array.size).to eql(6)
		end

		it "returns empty array if no file present" do
			parser = Parser.new
			array = parser.process_unique_file_url
			expect(array.size).to eql(0)
		end

		it "should return the correct element" do
			parser = Parser.new
			array = parser.process_unique_file_url("./lib/webserver.log")
			expect(array.first[0]).to eql("/help_page/1")
			expect(array.first[1]).to eql(80)
		end
	end


	describe "#unique visits" do
		it "All items should be are unqiue" do
			parser = Parser.new
			array = parser.process_unique_visit("./lib/webserver.log")
			expect(array).to eql([["/help_page/1", 23], ["/contact", 23], ["/home", 23], ["/about/2", 22], ["/index", 23], ["/about", 21]])
		end
	end

end