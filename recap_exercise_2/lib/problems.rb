# Write a method, least_common_multiple, that takes in two numbers and
# returns the smallest number that is a mutiple
# of both of the given numbers



def least_common_multiple(num_1, num_2)
    max = num_1 * num_2
    multiples = []
    (1..num_2).select { |ele| multiples << ele * num_1 }
    (1..num_1).select { |ele| multiples << ele * num_2 }
    sorted = multiples.sort
    sorted.each_with_index do |ele, i|
        if sorted[i] == sorted[i + 1]
            return ele
        end
    end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.

def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    i = 0
    while i < str.length - 1
        bigram = str[i] + str[i + 1]
        bigrams[bigram] += 1
        i += 1
    end
    
    sorted = bigrams.sort_by {|k, v| v }
    sorted[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.invert
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns 
    # the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                count += 1 if j > i && ele1 + ele2 == num
            end
        end
        count 
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        
    end
end
