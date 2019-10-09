require "stringer/version"

module Stringer
  class Error < StandardError; end

  def self.spacify *strings
    strings.join(" ")
  end

  def self.minify(string, max_length)
    if string.length > max_length
      string[0, max_length] + "..."
    else
      string
    end
  end

  def self.replacify(text, word, replace)
       text = text.split(" ")

    text.map! do |elem|
      if elem == word
        replace
      else
        elem
      end
    end

    text.join(" ")
  end

  def self.tokenize(string)
    string.split(" ")
  end

  def self.removify(string, word)
    text = string.split(" ")
    text.reject! { |elem| elem == word }
    text.join(" ")
  end
end
