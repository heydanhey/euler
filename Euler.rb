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
    n != 1
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

  def self.smallest_multiple(input)
    lowest = input
    step = 0
    found = false
    until found
      step = step + 1
      [*1..input].each_with_index do |n, i|
        if lowest % n != 0
          lowest = input * step
          break
        end
        found = true if i == input - 1
      end
    end
    lowest
  end

  def self.pythagorean_triplet?(a, b, c)
    a ^ 2 + b ^ 2 == c ^ 2
  end

  def self.find_pythagorean_triplet_sum(sum)
    run_limit = 10000

    for a in 1..run_limit do
      for b in 2..run_limit do
        c = Math.sqrt((a**2) + (b**2))
        return [a, b, c.to_i] if [a, b, c].sum == sum
      end
    end

    'No Pythagorean Triplet'
  end

  def self.summation_of_primes(input)
    primes = [*2...input]
    [*2...Math.sqrt(input)].each do |n|
      primes = primes.reject { |p| n != p && p % n == 0 }
    end
    primes.sum
  end

end