# frozen_string_literal: true

require 'fib_manager'

RSpec.describe FibManager do
  describe '#create' do
    it 'returns an empty string for an input of zero' do
      expect(subject.create(0)).to eq ''
    end

    it 'returns a basic sequence for an input of three or less' do
      expect(subject.create(3)).to eq '0 1 1'
    end

    it 'returns an extended sequence for a longer input' do
      expect(subject.create(0)).to eq '0 1 1 2 3 5 8 13 21 34 55'
    end

    it 'raises an error for input that is not a natural number' do
      expect { subject.create('astring') }.to raise_error ArgumentError
      expect { subject.create(-1) }.to raise_error ArgumentError
    end
  end
end
