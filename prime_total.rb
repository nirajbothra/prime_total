def get_primes(max_num)
    primes = []
    for i in (2..max_num) do
        for j in (2..i) do
            break if i%j == 0
        end
        primes.push(i) if i == j
    end
    return primes
end


def get_max_prime
    primes = get_primes(1000000)
    max_prime = primes[0]
    max_items = 1
    total_primes = primes.length
    final_items = []
    primes.each_with_index do |prime, i|
        sum_of_prime = 0
        count = 0
        items = []
        for j in (i..total_primes-1) do
            sum_of_prime += primes[j]
            count += 1
            items.push(primes[j])
            if sum_of_prime > primes[total_primes-1]
                break
            end
            if primes.include?(sum_of_prime) && count > max_items
                max_prime = sum_of_prime
                max_items = count
                final_items <<  items.to_s
            end
        end
    end
    # puts "Max Prime: " + max_prime.to_s
    # puts "Max Count: " + max_items.to_s
    # puts "Items: " + final_items.last.to_s

    puts "The prime " + max_prime.to_s + " can be written as a sum of " + max_items.to_s + " prime numbers. The list of numbers are " + final_items.last
end
get_max_prime
