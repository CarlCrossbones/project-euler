local odd_squares_sum = 0
local max_iter = 507000


for i=1, max_iter do
    if (i * i) % 2 == 1 then
        odd_squares_sum = odd_squares_sum + (i * i)
    end
end

print(odd_squares_sum)