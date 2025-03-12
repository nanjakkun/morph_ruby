# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Morph::Trie do
  let(:trie) { described_class.new }

  describe '#search' do
    it do
      trie.insert(Morph::Word.new('apple'))
      trie.insert(Morph::Word.new('app'))

      expect(trie.search('apple')).not_to be_nil
      expect(trie.search('apple').key).to eq 'apple'

      expect(trie.search('app')).not_to be_nil
      expect(trie.search('app').key).to eq 'app'

      expect(trie.search('appl')).to be_nil
    end
  end

  describe '#delete' do
    it do
      trie.insert(Morph::Word.new('apple'))
      trie.insert(Morph::Word.new('app'))

      trie.delete('apple')

      expect(trie.search('apple')).to be_nil

      expect(trie.search('app')).not_to be_nil
      expect(trie.search('app').key).to eq 'app'

      expect(trie.search('appl')).to be_nil
    end
  end
end
