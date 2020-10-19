class Intervals
  def initialize(arr)
    @copy_arr = arr
    @sorted_arr = arr.sort
  end
  
  def self.min(truth_arr)
    min = truth_arr.join(' ').split.min
  end

  def self.max(truth_arr)
    max = truth_arr.join(' ').split.max
  end

  def self.find_interval(arr)
    @copy_arr = arr
    interval = []
    interval.push(min(@copy_arr), max(@copy_arr))
  end

  def self.lies_and_push(arr)
    s = arr.sort
    res = []
    last_res = []
    (0..s.size - 2).each do |i|
        p s[i]
        res.push(s[i]) if s[i].last < s[i + 1].first || s[i + 1] == nil
      s[i].first <= s[i + 1].last && s[i].last >= s[i + 1].first ? res.push(s[i], s[i + 1]) : last_res.push(find_interval(res)) && res.clear
    end
    last_res.push(find_interval(res))
  end
  

  def self.free_time(arr)
    @copy_arr = lies_and_push(arr)
    free = []
    (0..@copy_arr.size - 2).each do |i|
      free.push([@copy_arr[i].last, @copy_arr[i + 1].first])
    end
    free
  end
end

arr = [['10:00', '10:20'], ['10:40', '11:00'], ['11:00', '12:00'], ['12:00', '13:00'], ['13:30', '18:20']]
# sorted_arr = [["10:00", "10:20"], ["10:00", "10:20"], ["10:30", "10:35"], ["10:40", "11:00"], ["10:50", "12:00"], ["12:00", "13:00"], ["14:40", "15:00"], ["14:50", "16:00"]]

p Intervals.free_time(arr)
