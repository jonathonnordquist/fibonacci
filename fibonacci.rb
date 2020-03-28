# frozen_string_literal: true

require './lib/fib_manager'
require 'pry'

def run_code
  if ARGV.empty?
    puts 'You must enter a natural number value'
  else
    puts FibManager.new.create(ARGV[0])
  end
rescue ArgumentError => e
  puts e
end

run_code
