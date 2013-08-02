class WordFrequencyReport
  attr_reader :text, :word_count, :options

  def initialize(text, options = {})
    @options = options
    @text    = text
  end

  def exclude_common_words?
    options.fetch(:exclude_common, false)
  end

  def analyze
    words = text.split(/[^a-zA-Z]/)
    words.reject! { |word| word =~ /\A[\s\t]*\Z/ }

    words.reject! { |word| common_words.include? word } if exclude_common_words?

    frequencies = Hash.new(0)
    words.each { |word| frequencies[word] += 1 }

    @word_count = words.count

    frequencies = frequencies.sort_by { |x,y| y }
    frequencies.reverse!

    frequencies
  end

  def common_words
    %w(to of in for on with at by from up about into over after beneath under
       above the and a that I it not he as you this but his they her she or an
       will my one all would there their)
  end
end
