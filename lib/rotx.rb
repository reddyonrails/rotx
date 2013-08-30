require "rotx/version"

module Rotx
  def rotx(integer, string,cipher = :encrypt)
    raise ArgumentError, 'Please enter integer value greater than zero' if integer.to_i < 1
    raise ArgumentError, 'Please enter input string' unless string.to_s.length > 0

    integer = integer%26
    output = ""
    string.chars.each do |char|
      output << (char.match(/[a-zA-Z]/) ? get_transformed_char(integer, char,cipher) : char)
    end
    output
  end

  def get_transformed_char(integer, char, cipher)
    lower_limit,upper_limit = get_ascii_limits(char)
    direction = cipher == :encrypt ? 1 : -1
    new_ord = char.ord+(integer)*direction
    if direction ==  1
      new_ord = lower_limit-1+(new_ord%upper_limit) if new_ord > upper_limit
    else
      new_ord = upper_limit+1-(lower_limit+(new_ord)*-1) if new_ord < lower_limit
    end
    (new_ord).chr
  end

  def get_ascii_limits(char)
    if char.upcase == char #uppercase
      ['A'[0].ord,'Z'.ord]
    else
      ['a'[0].ord,'z'.ord]
    end
  end
end