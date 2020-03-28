# frozen_string_literal: true

require '../lib/fib_manager'

RSpec.describe FibManager do
  describe '#create' do
    it 'returns an empty string for an input of zero' do
      expect(subject.create(0)).to eq ''
      expect(subject.create('0')).to eq ''
    end

    it 'returns a basic sequence for an input of three or less' do
      expect(subject.create(3)).to eq '0 1 1'
      expect(subject.create('3')).to eq '0 1 1'
    end

    it 'returns an extended sequence for a longer input' do
      expect(subject.create(11)).to eq '0 1 1 2 3 5 8 13 21 34 55'
      expect(subject.create('11')).to eq '0 1 1 2 3 5 8 13 21 34 55'
    end
    it 'raises an error for input that is not a natural number' do
      expect { subject.create('astring') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { subject.create('1astring1') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { subject.create('astr11ing') }.to raise_error ArgumentError, 'input must be a natural number'
      expect { subject.create(-1) }.to raise_error ArgumentError, 'input must be a natural number'
      expect { subject.create(1.1) }.to raise_error ArgumentError, 'input must be a natural number'
    end
  end
end
