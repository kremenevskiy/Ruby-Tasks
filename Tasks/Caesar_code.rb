# Caesar task


def encrypt_ch(ch, key)
  int_ch = ch.ord

  if int_ch > 96
    new_ch = (int_ch - 97 + key) % 26 + 97
  else
    new_ch = (int_ch - 65 + key) % 26 + 65
  end
  new_ch.chr
end


def decrypt_ch(ch, key)
  encrypt_ch(ch, -key)
end


def character?(ch)
  int_ch = ch.ord

  if (int_ch > 64 && int_ch < 91) || (int_ch > 96 && int_ch < 123)
    return true
  end
  false
end


def encryption(text, key)
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


def decryption(text, key)
  encryption(text, -key)
end


# testing program

file = File.open("Caesar.txt", "r")

text = ""
for line in file
  text += line
end

print "Enter encryption key: "
key = gets.to_i

encrypted = encryption(text, key)
puts "\nEncrypted text:\n"
puts encrypted

decrypted = decryption(encrypted, key);
puts "\nDecrypted text:\n"
puts decrypted