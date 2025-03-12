# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Morph::LongestMatch::V2::Analyzer do
  let(:dict) do
    trie = Morph::Trie.new

    %w[吾輩 吾 輩 は 猫 で ある].each do |key|
      trie.insert(Morph::Word.new(key))
    end

    trie
  end

  let(:analyzer) { described_class.new(dict) }
  let(:text) { '吾輩は猫である' }

  describe '#analyze' do
    subject(:results) { analyzer.analyze(text) }

    it 'should break down text into morphemes' do
      expect(subject.map(&:to_s)).to eq %w[吾輩 は 猫 で ある]
    end
  end
end
