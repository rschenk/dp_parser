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
                   ['1984 Fall',                {:year => 1984, :month => 9, :day => 21, :season => true}],
                   ['1994 Autumn',              {:year => 1994, :month => 9, :day => 21, :season => true}],
                   ['1990 Spring-Summer',       {:year => 1990, :month => 3, :day => 21, :season => true}],
                   ['1974-1975 Winter',         {:year => 1974, :month => 12,:day => 21, :season => true}],
                   ['1981-1982 Winter-Spring',  {:year => 1981, :month => 12,:day => 21, :season => true}],
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
    
    describe "seasons" do
      it "should set the date to the first day of that season" do
        @parser.parse('1990 Spring').to_h.should == { :season => true, :year => 1990, :month => 3, :day => 21 }
        @parser.parse('1974 Summer').to_h.should == { :season => true, :year => 1974, :month => 6, :day => 21 }
        @parser.parse('1980 Fall').to_h.should   == { :season => true, :year => 1980, :month => 9, :day => 21 }
        @parser.parse('1976 Winter').to_h.should == { :season => true, :year => 1976, :month => 12, :day => 21 }
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
  
  describe '#season?' do
    it "should return true if date was falsified by the beginning of a season" do
      @parser.parse('1990 Sep 21').should_not be_season
      @parser.parse('1990 Fall').should be_season
    end
  end
end

