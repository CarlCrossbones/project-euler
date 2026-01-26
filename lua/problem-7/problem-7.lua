
function isPrime(num)
    if num == 0 or num == 1 then return false end
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end
    return true
end

local prime_count = 0
local i = 1
while prime_count < 10001 do
    i = i + 1
    if isPrime(i) then
        prime_count = prime_count + 1
    end
end
print(i)