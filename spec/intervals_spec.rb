# frozen_string_literal: true

require 'rspec/autorun'
require_relative '../lib/script.rb'

describe Intervals do
  let(:free_time) { Intervals.new }
  it 'should return the free parts of our time intervals' do
    arr = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']]
    res = [['10:20', '10:40']]
    expect(Intervals.free_time(arr)).to eq(res)
  end

  it 'should return the free parts of our time intervals' do
    arr = [['10:00', '10:20'], ['10:00', '10:20'], ['10:40', '11:00'], ['10:30', '10:35'], ['10:50', '12:00'], ['12:00', '13:00'], ['14:40', '15:00'], ['14:50', '16:00']]
    res = [["10:20", "10:30"], ["10:35", "10:40"], ["13:00", "14:40"]]
    expect(Intervals.free_time(arr)).to eq(res)
  end

  it 'without intersections' do
    times = ([['10:00', '10:20'], ['10:40', '11:00'], ['11:50', '12:00'], ['12:10', '13:00'], ['10:00', '10:20']])
    expect(Intervals.free_time(times)).to eq([[ '10:20', '10:40'], ['11:00', '11:50'], ['12:00', '12:10']])
  end

  it 'with one intersection' do
    times = ([['10:00', '10:20'], ['10:10', '11:00'], ['11:50', '12:00'], ['12:10', '13:00'], ['10:00', '10:20']])
    expect(Intervals.free_time(times)).to eq([['11:00', '11:50'], ['12:00', '12:10']])
  end

  it 'with chain of the intersection' do
    times = ([['10:00', '10:20'], ['10:10', '11:00'], ['11:00', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']])
    expect(Intervals.free_time(times)).to eq([])
  end

  it 'with intersection in middle' do
    times = ([['10:00', '10:20'], ['10:40', '11:00'], ['11:00', '12:00'], ['12:30', '13:00'], ['10:00', '10:20']])
    expect(Intervals.free_time(times)).to eq([['10:20', '10:40'], ['12:00', '12:30']])
  end

  it 'first and last arent intersection' do
    times = ([['10:00', '10:20'], ['10:40', '11:00'], ['11:00', '12:00'], ['12:00', '13:00'], ['13:30', '18:20']])
    expect(Intervals.free_time(times)).to eq([['10:20', '10:40'], ['13:00', '13:30']])
  end

  it 'unsorted input array' do
    times = ([['10:00', '10:20'], ['12:00', '13:00'], ['10:40', '11:00'], ['11:00', '12:00'], ['13:30', '18:20']])
    expect(Intervals.free_time(times)).to eq([['10:20', '10:40'], ['13:00', '13:30']])
  end
end