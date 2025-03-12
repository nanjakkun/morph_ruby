# frozen_string_literal: true

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
