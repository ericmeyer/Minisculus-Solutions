class MarkIV
  @@keyboard = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
    "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
    "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
    "w", "x", "y", "z", ".", ",", "?", "!", "'", "\"", " "]

  def self.keyboard
    @@keyboard
  end

  def self.keyboard=(new_keyboard)
    @@keyboard = new_keyboard
  end

  def initialize(wheel_one_position, wheel_two_position)
    @shift_amount = wheel_one_position - (2 * wheel_two_position)
  end

  def encrypt(plaintext)
    plaintext.chars.collect do |char|
      cchar = keyboard[(keyboard.index(char) + @shift_amount) % keyboard.length]
      if @previous_char
        cchar = keyboard[(keyboard.index(cchar) + (2 * keyboard.index(@previous_char))) % keyboard.length]
      end
      @previous_char = char
      cchar
    end.join
  end

  def decrypt(code)
    code.chars.collect do |char|
      plain_char = keyboard[(keyboard.index(char) - @shift_amount) % keyboard.length]
      if @previous_char
        plain_char = keyboard[(keyboard.index(plain_char) - (2 * keyboard.index(@previous_char))) % keyboard.length]
      end
      @previous_char = plain_char
      plain_char
    end.join
  end

  private

  def keyboard
    @@keyboard
  end
end