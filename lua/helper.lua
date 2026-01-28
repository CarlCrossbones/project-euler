local helper = {}

-- Determine if a number is prime
function helper.isPrime(num)
    if num == 0 or num == 1 then return false end
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end
    return true
end

-- Determine the divisors of a number. Returns a list. Memor
function helper.findDivisors(num)
    local divisors = {}
    for i = 1, math.sqrt(num) do
        if num % i == 0 then
            table.insert(divisors, i)

            if i ~= num // i then table.insert(divisors, num // i) end
        end
    end
    return divisors
end

-- Determine the triangle number for a given iteration of the sequence
function helper.findTriangleNumber(iteration)
    local triangleNum = 0
    for i = 1, iteration do
        triangleNum = triangleNum + i
    end
    return triangleNum
end

-- Parse lines from common html number scheme on projecteuler.net.
-- Returns a list of numbers.
-- NOTE: the path must be relative to where the helper file is located.
function helper.parseLines(path)
    local listOfNums = {}
    local file, err = io.open(path)

    if not file then
        return nil, err
    end

    local content = file:read("*all")
    for line in string.gmatch(content, "(%d+)<br>") do
        table.insert(listOfNums, tonumber(line))
    end
    

    return listOfNums
end

return helper