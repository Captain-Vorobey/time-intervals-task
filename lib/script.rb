# p arr[1][0] #== arr[2][0]
# p arr.sort

class Intervals
  def self.sort_arr(arr)
    sorted_array = arr.sort
    sorted_array
  end

  def self.min(truth_arr)
    min = truth_arr.join(' ').split.min
  end

  def self.max(truth_arr)
    max = truth_arr.join(' ').split.max
  end

  def self.find_interval(arr)
    truth_arr = arr
    interval = []
    interval.push(min(truth_arr), max(truth_arr))
  end

  def self.lies_and_push(arr)
    s = sort_arr(arr)
    res = []
    last_res = []
    (0..s.size - 2).each do |i|
      (0..0).each do |j|
        if i >= 1
          res.push(s[i]) if s[i - 1][1] < s[i][0] && s[i][1] < s[i + 1][0]
        end
        if s[i][j] <= s[i + 1][j + 1] && s[i][j + 1] >= s[i + 1][j]
          res.push(s[i], s[i + 1])
        else
          last_res.push(find_interval(res))
          res.clear
        end
      end
    end
    last_res.push(find_interval(res))
  end

  def self.free_time(arr)
    new_arr = lies_and_push(arr)
    last_res = []
    (0..new_arr.size - 2).each do |i|
      (0..0).each do |_j|
        last_res.push([new_arr[i].last, new_arr[i + 1].first])
      end
    end
    last_res
  end
end

arr = [['10:00', '10:20'], ['10:00', '10:20'], ['10:40', '11:00'], ['10:30', '10:35'], ['10:50', '12:00'], ['12:00', '13:00'], ['14:40', '15:00'], ['14:50', '16:00']]
# sorted_arr = [["10:00", "10:20"], ["10:00", "10:20"], ["10:30", "10:35"], ["10:40", "11:00"], ["10:50", "12:00"], ["12:00", "13:00"], ["14:40", "15:00"], ["14:50", "16:00"]]

p Intervals.free_time(arr)
