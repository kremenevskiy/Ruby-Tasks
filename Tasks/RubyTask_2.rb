#Mini Task #1
# С клавиатуры вводится дата, единицы измерения и длительность -
# нужно вывести N последующих дат - использовать Хеш (ключ - ед.измерения, значения - Лямбда )



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
      if inverted_hash.has_key?(value)
        inverted_hash[value] += [key]
      else
        inverted_hash[value] = [key]
      end
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


