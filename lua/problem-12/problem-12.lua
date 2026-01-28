local helper = require("helper")

-- Find the value of the first triangle number to have over 500 divisors.
-- We already know 28 (7th in series) has 5, so we can start at the 8th iteration.
local divisorCount = 5
local iteration = 8
local triangleNum = 28
while divisorCount < 501 do
    triangleNum = helper.findTriangleNumber(iteration)
    currDivisorCount = #helper.findDivisors(triangleNum)
    if currDivisorCount > divisorCount then divisorCount = currDivisorCount end
    iteration = iteration + 1
end

print("triangleNum: " .. triangleNum)
print("divisorCount: " .. divisorCount)