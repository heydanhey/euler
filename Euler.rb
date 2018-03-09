class Euler

  def self.sum_of_multiples_three_and_five(input)
    [*0...input].select{|n| n%3==0 || n%5==0 }.inject(0,:+)
  end

  def self.sum_fibonacci_evens(input)
    sum = 0
    prev = 0
    current = 1
    while current < input
      sum += current if current.even?  
      temp = prev + current;
      prev = current
      current = temp
    end
    sum
  end

  def self.is_prime(n)
    i = 2
    while i < n
      if (n % i) == 0
        return false 
      end
      i += 1
    end
    n != 1;
  end

  def self.count_primes(count)
    temp = [2]
    index = 3
    until temp.length == count
      temp << index if Euler.is_prime(index)
      index += 1
    end
    temp.pop
  end

  def self.product_in_a_series(input, num_adjacent)
    index = 0
    arr = input.digits
    sum = 0
    while (index + num_adjacent - 1) < arr.length
      temp = arr.values_at(index...num_adjacent+index).inject(:*)
      sum = temp if temp > sum
      index += 1
    end
    sum
  end



end