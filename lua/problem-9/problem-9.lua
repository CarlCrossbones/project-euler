local a = 3
local b = 3
local answer = 0
while answer < 1000 do
    for i=a, 25 do
        answer = i^2 + b^2
    end
end

print(answer)
print(a)
print(b)