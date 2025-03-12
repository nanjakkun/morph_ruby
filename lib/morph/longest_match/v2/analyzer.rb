# frozen_string_literal: true

module Morph
  module LongestMatch
    module V2
      class Analyzer
        def initialize(dictionary)
          @dictionary = dictionary
        end

        def analyze(text)
          results = []
          index = 0
          len = 1

          while index < text.length
            key = text[index, len]

            res = @dictionary.search(key)

            if res && (index + len <= text.length)
              if res.word
                longest_candidate = res.word
              end

              len += 1
            else
              results << longest_candidate
              index += longest_candidate.key.length
              len = 1
            end
          end

          results
        end
      end
    end
  end
end
