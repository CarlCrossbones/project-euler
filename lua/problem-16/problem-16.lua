-- get the sum of the digits contained in 2^1000

local value = 2^1000
local value_string = string.format("%0.f", value)
local sum_of_digits = 0

for i=1, #value_string do
    sum_of_digits = sum_of_digits + tonumber(value_string:sub(i, i))
end
print(sum_of_digits)