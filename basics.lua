--[[
For more lua
visit
https://www.lua.org/pil/contents.html
]]

print("Hello, World!")

-- You can make comments like this! Just use "--"

--[[
You
can
do
multi
line
comments
like
this
]]


--Four main datatypes: Number, String, Boolean, nil(no value)
--Other datatypes: tables, functions, userData, and threads

--[[print(1)
print("The Lord of the Rings: Return of the King")
print(true)
print(nil)

--Syntax is looser in lua. which quotes you use doesn't matter.
--To add things like quotes to print statements use \
print("\"Hello\" my friends")

--type() command gives you the datatype
print(type(nil))

--Math operators
print(5+5)
print(5-5)
print(5*5)
print(5/5)
print(5%5)
print(5^5)
print(-5)

--------Variables!--------

--Basically like python Variables
--Variable type is declared when value is assigned

local player1Name = "Kamala"
local player2Name = "Bruno"
local highestScore = nil

print(player1Name)
--Variables DO NOT HAVE A TYPE. They are just containers

------Concatenation--------
--concatenation operater is ..
print("The first player is: " .. player1Name)


--Type coercion is the conversion of a value of a datatype to another
--coercion happens from right to left. Within reason, the last datatype will be the final one
--We can be clear with out conversions by using variations of this: tonumber()
local player1Score = 13
local player2Score = 15

print(type("Player 1 Score: " .. player1Score))

print(type("Player 2 Score: " .. player2Score))

print(type("100" + 5))
print(type("100" + 5 .. 6))

------Logic! (Control Structures)--------
local isHungry = true
if isHungry then
    --Indention is for readability
    print("I need food")
end

-- Comparison operators are the same as everything elements

isHungry = false
if isHungry then
    print("I need food")
else 
    print("I am full, thanks")
end

local peopleInRoom = 10
local chairsInRoom = 5
if peopleInRoom == 0 then
    print("No one showed up!")
elseif peopleInRoom <= chairsInRoom then
    print("We have enough chairs")
else
    print("We don't have enough chairs")
end

-- Three logical operaters: and, or, not

-- LOOK UP THE ORDER OF OPERATIONS FOR BUGS
-- But fr just use parantheses

-----Functions!-------

--Basic function
local function printShoppingCartTotal()
    local subtotal = 100
    local taxRate = 1.2
    local total = subtotal * taxRate
    print(total)
  end

--function with parameters
function printShoppingCartTotal(subtotal, taxRate)
  local total = subtotal * taxRate
  print(total)
end

printShoppingCartTotal(100, 1.2)

--function with Return

local function getShoppingCartTotal(subtotal, taxRate)
  local total = subtotal * taxRate
  return total
end

local total1 = getShoppingCartTotal(200, 1.2)
print(total1)

-----Other Data Types-----
--Tables (AN OBJECT, compare to dict in python)
local a = {}     -- create a table and store its reference in `a'
local k = "x"
a[k] = 10        -- new entry, with key="x" and value=10
a[20] = "great"  -- new entry, with key=20 and value="great"
print(a["x"])    --> 10
local k = 20
print(a[k])      --> "great"
a["x"] = a["x"] + 1     -- increments entry "x"
print(a["x"])    --> 11

----Basic loop stuff----
local i = 1
    while a[i] do
      print(a[i])
      i = i + 1
    end




--[[
j = 10         -- global variable
local i = 1    -- local variable

Unlike global variables, local variables 
have their scope limited to the block where 
they are declared. A block is the body of a 
control structure, the body of a function, 
or a chunk (the file or string with the code 
where the variable is declared).
]]


--[[
--do blocks are a thing too
do
local b = "j"
print(b)
end

--Repeat block
local z = 0
repeat
    z = z + 1
until z == 10
print(z)

-- numeric for loop (compare to java for loop)
for i=10,1,-1 do 
    print(i) 
end

--break is also a thing but it's like every other language

]]--

-- arrays
local a = {}
for i = 1, 5 do -- Arrays in Lua start at index 1, and so do all the libraries.
    a[i] = 0
end -- and here you have an array of empty values.

--make function to get length of array
local function length(array)
    local i = 0
    for key, item in pairs(array) do
        i = i + 1
        --print(key) -- this will print the key of the dictionary
        --print(item) -- this will print the value of each dictionary, gotten from the pairs() method in the for declaration
    end
    return i
end
print(length(a))

--multi-dimensional arrays
local a = {}
for i = 1, 5 do
    a[i] = {}
    for j = 1, 5 do
        a[i][j] =0
    end
end
print(length(a[1]))

--recursion
local function fibonnaci(number)
    if number <= 1 then
        return number
    else
        return fibonnaci(number-1) + fibonnaci(number-2)
    end
end
print(fibonnaci(5))

--metatables 
    --metatables are confusing but powerful. They allow us to change the operability of tables, 
    --for example taking two tables and having an add function between the values

local meta = {}
meta.__add = function(left, right) -- adds the addition operability to tables
    return left.value + right.value
end
local container1 = {value = 5}
local container2 = {value = 4}
setmetatable(container1, meta)
local total = container1 + container2
print(total)
--the setmetatable method matters, but the order does not in this case.

-- __index method
    --pairs two metatables to share some indexes if setmetatable(x, y)
    --in this example, table x does not have the hello key, but can print it because of the metatable it is set with table y
local x = {foo = "bar"}
y = {
    hello = "world y", 
    __index = function(table, key)
        return y[key]
    end
}
setmetatable(x, y)
print(x.foo)
print(x.hello) -- output table y's value despite not having the hello key because of the metatable

-- __newindex method
    -- assigns values to missing keys in a table
x = {}
local z = {}
y = {
    __index = function(table, key)
        return y[key]
    end,
    __newindex = function(table, key, value)
        y[key] = value
    end
}
setmetatable(x, y)
setmetatable(z, y)
x.foo = "bar"
print(x.foo) -- returns bar
print(y.foo) -- because at least one table has a key and value, y and z are also able to return values on that key.
print(z.foo)

-- if tables have metamethods that populate a table's key values, you can bypass them with the rawget() and rawset() methods
-- using the __newindex method above,
rawset(x, "foo", "raw")
print(x.foo) -- returns "raw"
print(y.foo) -- returns "bar"

-- __call method
    -- allows a table to be called like a function. In Lua, such a table is called a functor
local tb1 = {
    __call = function(table, val1, val2)
        return "Greetings from the functor: " .. (val1 + val2)
    end
}
setmetatable(tb1, tb1)
total = tb1(2, 3)
print(total)

--Classes
    -- It is not native to Lua, and there is no constructor like in Python. Things therefore get creative with tables
Enemy = {}
Enemy.health = 200
Enemy.attack = 4
Enemy.defense = 20 -- the health, attack, and defense are like the default values of variables in the constructor
Enemy.new = function(self, object) -- this creates a new table... first argument should always be self
    object = object or {} -- object has to be some table for the values that we want specified
    setmetatable(object, self)
    self.__index = self
    return object
end

local grunt = Enemy.new(Enemy) -- is a perfect clone of the Enemy list
local boss = Enemy.new(Enemy, {health = 500, defense = 100}) -- the table gives the specifications for the 
                                                             -- health and defense stats of the boss, but the default
                                                             -- attack stat stays the same because of the self.__index 
                                                             -- method in the Enemy.new function

-- Class methods
    --Since you can store functions in a table, you can use it to manipulate data within the table/class
Enemy.hit = function(self, damage)
    damage = damage - self.defense
    if damage < 0 then
        damage = 0
    end
    self.health = self.health - damage
end
Enemy.hit(boss, 150) -- function called as a key and changes the boss instance health
print(boss.health)

--using a colon operator automatically inputs the self into the equation, for example...
--      local miniboss = Enemy:new()
--          is the same as
--      local miniboss = Enemy.new(Enemy)

--inheritance