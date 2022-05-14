TEXT_FILE = "romeo-juliet.txt"
COMPARISON_TEXT_FILE = "hamlet.txt"

# Load the words from a file
def words_from_file(text_file)
    File.read(text_file).downcase.gsub(/[^a-z]/, " ").split
rescue # If you put an error type here, you can name that after "rescue"
    puts "Give me #{text_file} and let's get this party started!"
    exit
end

# Load the list of words in the text
words = words_from_file TEXT_FILE

# Load the comparison text and remove duplicate words
words_to_remove = words_from_file(COMPARISON_TEXT_FILE).uniq

# Remove any of the words in the comparison text from the words array
words_to_remove.each do |word|
    words.delete word
end

# Create a dictionary of word counts
WORD_COUNT = {} # This is a constant so that it is available in the REPL after importing with require
words.each do |word|
    # Set the count to 0 unless the WORD_COUNT already contains word
    WORD_COUNT[word] = 0 unless WORD_COUNT[word]

    # Increment the counter
    WORD_COUNT[word] += 1
end

WORD_COUNT.sort_by {|word, count| count }
          .reverse[0..40]
          .each {|word, count| puts "#{word}: #{count}"}