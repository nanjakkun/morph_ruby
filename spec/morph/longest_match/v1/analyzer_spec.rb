# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Morph::LongestMatch::V1::Analyzer do
  let(:dict) { %w[吾輩 吾 輩 は 猫 で ある] }
  let(:analyzer) { described_class.new(dict) }
  let(:text) { '吾輩は猫である' }

  describe '#analyze' do
    subject(:results) { analyzer.analyze(text) }

    it 'should break down text into morphemes' do
      expect(subject).to eq %w[吾輩 は 猫 で ある]
    end
  end
end
