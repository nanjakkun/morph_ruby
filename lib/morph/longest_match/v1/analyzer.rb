# frozen_string_literal: true

module Morph
  module LongestMatch
    module V1
      class Analyzer
        def initialize(dictionary)
          @dictionary = dictionary
        end

        def analyze(text)
          results = []
          index = 0

          while index < text.length
            longest_match = nil
            longest_length = 0

            @dictionary.each do |word|
              if text[index, word.length] == word && word.length > longest_length
                longest_match = word
                longest_length = word.length
              end
            end

            if longest_match
              results << longest_match
              index += longest_length
            else
              results << text[index]
              index += 1
            end
          end

          results
        end
      end
    end
  end
end
