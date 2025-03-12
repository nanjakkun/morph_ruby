# frozen_string_literal: true

# https://ja.wikipedia.org/wiki/%E3%83%88%E3%83%A9%E3%82%A4_(%E3%83%87%E3%83%BC%E3%82%BF%E6%A7%8B%E9%80%A0)
module Morph
  class Word
    attr_reader :key

    def initialize(key)
      @key = key
    end

    def to_s
      @key
    end
  end
end
