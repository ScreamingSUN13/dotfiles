-- Test script for syntax highlighting
local function greet(name)
    return "Hello, " .. name .. "!"
end

local Animal = {}
Animal.__index = Animal

function Animal.new(species)
    local self = setmetatable({}, Animal)
    self.species = species
    return self
end

for i = 1, 5 do
    if i % 2 == 0 then
        print(greet("World"), i)
    end
end
