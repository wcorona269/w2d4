# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

def all_vowel_pairs(words)
    pairs = []
    words.each_with_index do |word_1, idx1|
        words.each_with_index do |word_2, idx2|
            if idx2 > idx1
                vowels = ["a", "e", "i", "o", "u"]
                current_pair = [word_1, word_2]
                pairs << current_pair.join(" ") if vowels.all? {|vowel| word_1.include?(vowel) || word_2.include?(vowel) }
            end
        end 
    end
    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |ele|
        return true if num % ele == 0
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)

    bigrams.select {|bigram| str.split.join("").include?(bigram) }
end
    # chosen = []
    # i = 0
    # while i < str.length - 1
#             chosen << str[i] + str[i + 1]
#         end
#         i += 1
#     end

#     chosen
# end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)  
        passes = Hash.new(0)
        prc ||= Proc.new { |key, value| key == value }
        self.each do |key, value|
            if prc.call(key, value)
                passes[key] = value
            end
        end
        passes
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []

        (0...self.length).each do |idx1|
            (0...self.length).each do |idx2|
                subs << self[idx1..idx2] if idx2 >= idx1
            end
        end

        return subs if !length
        subs.select { |iter| iter.length == length }
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ""
        self.each_char do |char|
            old_idx = alpha.index(char)
            new_idx = old_idx + num
            new_str += alpha[new_idx % alpha.length]
        end
        new_str
    end
end

