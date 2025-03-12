# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Morph::Trie do
  let(:trie) { described_class.new }

  describe '#search' do
    it do
      trie.insert(Morph::Word.new('apple'))
      trie.insert(Morph::Word.new('app'))

      expect(trie.search('apple').word).not_to be_nil
      expect(trie.search('apple').word.key).to eq 'apple'

      expect(trie.search('app').word).not_to be_nil
      expect(trie.search('app').word.key).to eq 'app'

      expect(trie.search('appl').word).to be_nil
    end
  end

  describe '#delete' do
    it do
      trie.insert(Morph::Word.new('apple'))
      trie.insert(Morph::Word.new('app'))

      trie.delete('apple')

      expect(trie.search('apple')&.word).to be_nil

      expect(trie.search('app').word).not_to be_nil
      expect(trie.search('app').word.key).to eq 'app'

      expect(trie.search('appl')&.word).to be_nil
    end
  end
end
