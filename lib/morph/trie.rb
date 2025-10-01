# frozen_string_literal: true

# Trie
#
# https://ja.wikipedia.org/wiki/%E3%83%88%E3%83%A9%E3%82%A4_(%E3%83%87%E3%83%BC%E3%82%BF%E6%A7%8B%E9%80%A0)
module Morph
  class Trie
    attr_reader :word

    def initialize
      @root = TrieNode.new
      @word = nil
    end

    def insert(word)
      node = @root
      word.key.each_char do |char|
        node.children[char] ||= TrieNode.new
        node = node.children[char]
      end
      node.is_end_of_word = true
      node.word = word
    end

    def search(key)
      node = @root
      key.each_char do |char|
        return nil unless node.children[char]

        node = node.children[char]
      end
      node
    end

    def delete(key)
      delete_helper(@root, key, 0)
    end

    private

    # rubocop:disable Naming/PredicateMethod
    def delete_helper(node, key, depth)
      return false if node.nil?

      if depth == key.length
        return false unless node.is_end_of_word

        node.is_end_of_word = false
        node.word = nil
        return node.children.empty?
      end

      char = key[depth]
      should_delete_current_node = delete_helper(node.children[char], key, depth + 1)

      if should_delete_current_node
        node.children.delete(char)
        return node.children.empty? && !node.is_end_of_word
      end

      false
    end
    # rubocop:enable Naming/PredicateMethod
  end
end
