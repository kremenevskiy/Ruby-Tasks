#Mini Task #1
# С клавиатуры вводится дата, единицы измерения и длительность -
# нужно вывести N последующих дат - использовать Хеш (ключ - ед.измерения, значения - Лямбда)
puts "Task #1"

require 'date'
class Date
  def self.get_some_dates
    units = [:day, :month, :year]
    date = Hash.new

    puts "Enter a Date:"
    3.times do |i|
      printf "#{units[i].to_s}: "
      date[units[i]] = gets.to_i
    end

    date = Date.new(date[units[2]], date[units[1]], date[units[0]])
    puts "Date is #{date}\n"

    print "What units to increment?\n1.Day\n2.Month\n3.Year\nEnter number: "
    index = gets.to_i - 1
    print "Enter N(duration): "
    duration = gets.to_i

    puts "List of dates:"
    duration.times do |i|
      date += Date.date_increment(units[index], 1)
      puts "#{i+1}. Date: #{date}"
    end

  end

  def self.date_increment(unit, num)
    if unit == :day
      num
    elsif unit == :month
      num * 31
    elsif unit == :year
      num * 365
    end
  end
end

Date.get_some_dates


# Mini Task #2
# Сделать возможным safe_invert для Хэша
puts "\nTask #2\n"

class Hash
  def save_invert
    inverted_hash = Hash.new
    self.each do |key, value|
      inverted_hash[value] = key
    end
    inverted_hash
  end

  # approach 2, using arrays
  def save_invert_2
    inverted_hash = Hash.new(Array.new)
    self.each do |key, value|
      inverted_hash[value] += [key]
    end
    inverted_hash
  end
end

fruits_country = {
    'orange' => 'Marocco',
    'banana' => 'Ecuador',
    'lemon' => 'Marocco',
}

inverted_hash = fruits_country.save_invert
inverted_hash_2 = fruits_country.save_invert_2
puts "Approach 1: #{inverted_hash}"
puts "Approach 2: #{inverted_hash_2}"



# Mini Task #3
# На массиве реализовать метод получения Хэша (ключ - элемент, значение - количество повторений в массиве)
puts "\nTask #3\n"

class Array
  def to_histogram
    histogram = Hash.new(0)
    self.each do |word|
      histogram[word] += 1
    end
    histogram
  end
end

histogram = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'].to_histogram
puts histogram