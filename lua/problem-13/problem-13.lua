local helper = require("helper")

-- Return sum of 100 50 digit numbers
local sum = 0
for idx, val in ipairs(helper.parseLines("./problem-13/problem-13.html")) do 
    sum = sum + val
end
print(sum)