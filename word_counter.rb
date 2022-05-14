TEXT_FILE = "romeo-juliet.txt"

# Load the words from a file
def words_from_file(text_file)
    File.read(text_file).downcase.gsub(/[^a-z]/, " ").split
end

# Load the list of worsd in the text
words = words_from_file TEXT_FILE

# Create a dictionary of word counts
word_count = {}
words.each do |word|
    # if word_count[word] == nil
    #     # If this word is new, add it to word_count and set the count to 0
    #     word_count[word] = 0
    # end

    # Set the count to 0 unless the word_count already contains word
    word_count[word] = 0 unless word_count[word]

    # Increment the counter
    word_count[word] += 1
end