# frozen_string_literal: true

module Morph
  class TrieNode
    attr_accessor :children, :word, :is_end_of_word

    def initialize
      @children = {}
      @is_end_of_word = false
      @word = nil
    end
  end
end
