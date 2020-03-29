# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FibonacciService do
  describe '#create' do
    it 'returns an empty string for an input of zero' do
      expect(described_class.create(0)).to eq ''
      expect(described_class.create('0')).to eq ''
    end

    it 'returns a basic sequence for an input of three or less' do
      expect(described_class.create(3)).to eq '0 1 1'
      expect(described_class.create('3')).to eq '0 1 1'
    end

    it 'returns an extended sequence for a longer input' do
      expect(described_class.create(11)).to eq '0 1 1 2 3 5 8 13 21 34 55'
      expect(described_class.create('11')).to eq '0 1 1 2 3 5 8 13 21 34 55'
    end
    it 'raises an error for input that is not a natural number' do
      expect { described_class.create('astring') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { described_class.create('1astring1') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { described_class.create('astr11ing') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { described_class.create(-1) }.to raise_error ArgumentError, 'input must be a natural number'
      expect { described_class.create(1.1) }.to raise_error ArgumentError, 'input must be a natural number'
    end
  end
end
