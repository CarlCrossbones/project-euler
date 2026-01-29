-- Find the longest Collatz Sequence with a starting number under 1,000,000

local startingNum = 1
local longestChainLength = 0

local start_time = os.clock()

for i = 1, 999999 do
    currVal = i
    currLen = 0
    while currVal ~= 1 do
        if currVal % 2 == 0 then
            currVal = currVal / 2
        else
            currVal = (3 * currVal) + 1
        end
        currLen = currLen + 1
    end

    if currLen > longestChainLength then 
        longestChainLength = currLen 
        startingNum = i
    end
end

local end_time = os.clock()
local elapsed_time = end_time - start_time

print("Elapsed CPU time: " .. elapsed_time .. " seconds")

print("Starting Number: " .. startingNum)
print("Longest Chain Length: " .. longestChainLength)