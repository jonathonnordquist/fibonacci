# frozen_string_literal: true

class FibonacciService
  class << self
    def create(num)
      raise ArgumentError, 'input must be a natural number' unless valid_num(num)

      Rails.cache.fetch(num, expires_in: 2.minutes) do
        arr = Array.new(num.to_i)
        map_nums_into_arr(arr).join(' ')
      end
    end

    private
      def map_nums_into_arr(arr)
        arr.map!.with_index do |_e, i|
          if i < 2
            i
          elsif i == 2
            1
          else
            arr[i - 1] + arr[i - 2]
          end
        end
      end

      def valid_num(num)
        num.to_i >= 0 && num.to_s =~ /\A[0-9]*\Z/
      end
    end
end
