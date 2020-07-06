# Caesar task

class Encryption
  attr_accessor :text, :key

  def initialize(key = 0, text = "")
    @key = key
    @text = text
  end

  def encrypt_ch(ch, key = @key)
    int_ch = ch.ord

    if int_ch > 96
      new_ch = (int_ch - 97 + key) % 26 + 97
    else
      new_ch = (int_ch - 65 + key) % 26 + 65
    end
    new_ch.chr
  end

  def decrypt_ch(ch, key = @key)
    encrypt_ch(ch, -key)
  end

  def encryption(text = @text, key = @key)
    encrypted_text = ""

    text.each_char do |ch|
      if character?(ch)
        encrypted_text << encrypt_ch(ch, key)
      else
        encrypted_text << ch
      end
    end

    encrypted_text
  end

  def decryption(text, key = @key)
    encryption(text, -key)
  end

  def character?(ch)
    int_ch = ch.ord

    if (int_ch > 64 && int_ch < 91) || (int_ch > 96 && int_ch < 123)
      return true
    end
    false
  end

  def set_key
    print "\nEnter encryption key: "
    @key = gets.to_i
  end
end


class File
  def self.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close
  end
end


# testing program

text = ""

File.open_and_process("Caesar.txt", "r") do |file|
  for line in file
    text += line
  end
end

encrypt = Encryption.new(1, text)

encrypted_text = encrypt.encryption
puts "\nEncrypted text:\n"
puts encrypted_text

decrypted_text = encrypt.decryption(encrypted_text)
puts "\nDecrypted text:\n"
puts decrypted_text
