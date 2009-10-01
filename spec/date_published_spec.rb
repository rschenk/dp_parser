require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rubygems'
require 'treetop'
Treetop.load(File.dirname(__FILE__) + '/../lib/date_published')

#                   Input                       Expected Output
ABSOLUTE_DATES = [ ['2009',                     {:year => 2009}],
                   ['2009 May',                 {:year => 2009, :month => 5}],
                   ['2009 May 25',              {:year => 2009, :month => 5, :day => 25}] ]
DATE_RANGES    = [ ['1995-1997',                {:year => 1995}],
                   ['1977 May-Jun',             {:year => 1977, :month => 5}],
                   ['1983 Feb 17-23',           {:year => 1983, :month => 2, :day => 17}],
                   ['1991 Nov 21-Dec 4',        {:year => 1991, :month => 11,:day => 21}],
                   ['1990 Spring-Summer',       {:year => 1990, :month => 3, :day => 21}],
                   ['1974-1975 Winter',         {:year => 1974, :month => 12,:day => 21}],
                   ['1981-1982 Winter-Spring',  {:year => 1981, :month => 12,:day => 21}],
                   ['1995 Dec 14-1996 Jan 11',  {:year => 1995, :month => 12,:day => 14}],
                   ['1993 Dec-1994 Jan'      ,  {:year => 1993, :month => 12}]]

describe DatePublishedParser do
  before(:all) do
    @parser = DatePublishedParser.new
  end
  
  describe 'parsing' do
    describe 'absolute dates' do
      ABSOLUTE_DATES.each do |date, expected_return_fields|
      
        it "should parse #{date.inspect}" do
          @parser.should parse(date)
        end
      
      end
    end
  
    describe "date ranges" do
      DATE_RANGES.each do |date_range, expected_return_fields|
      
        it "should parse #{date_range.inspect}" do
          @parser.should parse(date_range)
        end
      
      end
    end
  end
  
  describe '#to_h' do
    (ABSOLUTE_DATES + DATE_RANGES).each do |date, expected_return_fields|
      
      it "should parse #{date.inspect} into #{pretty_print_hash expected_return_fields}" do
        @parser.parse(date).to_h.should == expected_return_fields
      end
      
    end
  end
  
  describe '#to_date' do
    (ABSOLUTE_DATES + DATE_RANGES).each do |date, expected_return_fields|
      
      it "should parse #{date.inspect} into #{pretty_print_date expected_return_fields}" do
        h = expected_return_fields
        @parser.parse(date).to_date.should == Date.new(h[:year], h[:month] || 1, h[:day] || 1)
      end
      
    end
    
  end
end

