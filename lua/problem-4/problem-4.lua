function isPalindrome(num)
    local reverse = 0

    local temp = num
    while temp ~= 0 do
        reverse = (reverse * 10) + (temp % 10)
        temp = temp // 10
    end
    return reverse == num
end

function findBiggestBoy()
    local largest = 0
    for i=100, 999 do
        for j=100, 999 do
            if isPalindrome(i*j) then
                if i*j > largest then
                    largest = i*j
                end
            end
        end
    end
    return largest
end

print(findBiggestBoy())