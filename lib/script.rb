# p arr[1][0] #== arr[2][0]
# p arr.sort

class Intervals
  def sort_arr(arr)
    sorted_array = arr.sort
    sorted_array
  end

  def find_interval(arr)
    truth_arr = arr
    interval = []
    last_interval = []
    min = truth_arr.join(' ').split.min
    max = truth_arr.join(' ').split.max
    interval.push(min, max)
  end

  def lies_and_push(arr)
    s = sort_arr(arr)
    truth_arr = []
    false_arr = []
    res = []
    (0..s.size - 2).each do |i|
      (0..0).each do |j|
        if s[i][j] < s[i + 1][j + 1] && s[i][j + 1] >= s[i + 1][j]
          truth_arr.push(s[i], s[i + 1])
        else
          res.push(find_interval(false_arr.push(s[i - 1], s[i])))
        end
      end
    end
    truth_arr -= false_arr
    res.push(find_interval(truth_arr))
  end
end

arr = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20']]
# sorted_array = [["10:00", "10:20"], ["10:00", "10:20"], ["10:40", "11:00"], ["10:50", "12:00"], ["12:00", "13:00"]]

p Intervals.new.lies_and_push(arr)
# result = [["10:00", "10:20"], ["10:40", "13:00"]]
