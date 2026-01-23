local fibb_sum = 2
local max_fibb = 4000000
local fibb_last = 1
local fibb_curr = 2
local temp

while fibb_curr < max_fibb do
    temp = fibb_curr
    fibb_curr = fibb_last + fibb_curr
    fibb_last = temp

    if fibb_curr % 2 == 0 then
        fibb_sum = fibb_sum + fibb_curr
    end
end

print(fibb_sum)
