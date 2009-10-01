$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end


module Matchers
  class Parse
    def initialize(expected)
      @expected = expected
    end
    
    def matches?(parser)
      @parser = parser
      result = @parser.parse(@expected)
      result.is_a?(Treetop::Runtime::SyntaxNode) and result.text_value == @expected
    end
    
    def failure_message
      "Expected #{@expected.inspect} to parse into a Treetop::Runtime::SyntaxNode"
    end
    
    def negative_failure_message
      "Expected #{@expected.inspect} to parse into a SyntaxNode... NAAAAAT!!!"
    end
  end
end

def parse(expected)
  Matchers::Parse.new(expected)
end

def pretty_print_hash(h)
 fields = []
 fields << ":year => #{h[:year]}" if h[:year]
 fields << ":month => #{h[:month]}" if h[:month]
 fields << ":day => #{h[:day]}" if h[:day]

 "{#{fields.join(', ')}}"
end


def pretty_print_date(h)
 Date.new(h[:year], h[:month] || 1, h[:day] || 1).to_s
end