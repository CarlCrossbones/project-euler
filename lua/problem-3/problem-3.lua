local prime_factors = {}
local number = 600851475143
local curr_factor = number
local search_len = number ^ 0.5

--print(search_len)

function isPrime(num)
    if num == 0 or num == 1 then return false end
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end
    return true
end

for i=1, number ^ 0.5 do
    if number % i == 0 and isPrime(i) then
        print(i)
    end
end
