local multiples_sum = 0
local max_iter = 999


for i=1, max_iter do
    if i % 3  == 0 or i % 5 == 0 then
        multiples_sum = multiples_sum + i
    end
    
end

print(multiples_sum)