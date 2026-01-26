local sum_square = 0
local square_sum = 0
for i=1, 100 do
    sum_square = sum_square + i^2
    square_sum = square_sum + i
end
square_sum = square_sum^2
print(square_sum - sum_square)
