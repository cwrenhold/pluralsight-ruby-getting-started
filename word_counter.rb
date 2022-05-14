TEXT_FILE = "romeo-juliet.txt"

# Load the words from a file
def words_from_file(text_file)
    File.read(text_file).downcase.gsub(/[^a-z]/, " ").split
rescue # If you put an error type here, you can name that after "rescue"
    puts "Give me #{text_file} and let's get this party started!"
    exit
end

# Load the list of worsd in the text
words = words_from_file TEXT_FILE

# Create a dictionary of word counts
WORD_COUNT = {} # This is a constant so that it is available in the REPL after importing with require
words.each do |word|
    # if WORD_COUNT[word] == nil
    #     # If this word is new, add it to WORD_COUNT and set the count to 0
    #     WORD_COUNT[word] = 0
    # end

    # Set the count to 0 unless the WORD_COUNT already contains word
    WORD_COUNT[word] = 0 unless WORD_COUNT[word]

    # Increment the counter
    WORD_COUNT[word] += 1
end

WORD_COUNT.sort_by {|word, count| count }
          .reverse[0..40]
          .each {|word, count| puts "#{word}: #{count}"}