# frozen_string_literal: true

require 'rspec/autorun'
require_relative '../lib/script.rb'

describe Intervals do
  let(:lies_and_push) { Intervals.new }
  it 'finds the intervals of times array' do
    expect(Intervals.new.lies_and_push([['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']])).to eq([['10:00', '10:20'], ['10:40', '13:00']])
  end
end
