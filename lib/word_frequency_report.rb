class WordFrequencyReport
  attr_reader :text, :word_count

  def initialize(text)
    @text = text
  end

  def analyze
    words = text.split(/[^a-zA-Z]/)
    words.reject! { |word| word =~ /\A[\s\t]*\Z/ }

    frequencies = Hash.new(0)
    words.each { |word| frequencies[word] += 1 }

    @word_count = words.count

    frequencies = frequencies.sort_by { |x,y| y }
    frequencies.reverse!

    frequencies
  end
end
