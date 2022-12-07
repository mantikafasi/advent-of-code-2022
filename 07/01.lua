local function copyStupitTable(original)
    local j = {}
    for key, value in pairs(original) do
      j[key] = value
    end
    return j
  end
  


local function toString(table)
    local s = ""
    for k,v in pairs(table) do
        s = s .. v
    end
    return s
end


function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end

local lines = io.lines("7.txt")
local totalSize = 0
local currentDir = {}
local hell = {}
hell["/"] = 0

for line in lines do

    if (string.starts(line,"$ cd ..")) then 
        table.remove(currentDir)

    elseif (string.starts(line, "$ cd")) then
        table.insert(currentDir ,string.sub(line,6))

    elseif (string.starts(line,"$")) then
    elseif (not string.starts(line, "dir")) then
        
        local matchs = {}
        for k in line:gmatch("%S+") do
            table.insert(matchs, k)
        end
        
        local hdir = toString(currentDir)
        hell[hdir] = (hell[hdir] or 0) + tonumber(matchs[1])

        local altTable = copyStupitTable(currentDir)  

        for i in ipairs(currentDir) do
            table.remove(altTable)
            local ldir = toString(altTable)
            
            hell[ldir] = (hell[ldir] or 0) + tonumber(matchs[1])
        

        end
        
    end
end


for k,v in pairs(hell) do
    
    if (v <= 100000) then 
        totalSize = totalSize + v end
end
print("Part 1: " .. totalSize)

local totalSizePlus = 0 
for k,v in pairs(hell) do
    totalSizePlus = totalSizePlus + v
end

local needed = -(70000000 - hell["/"] - 30000000 )
local min = 70000000 -- just a big number
for k,v in pairs(hell) do
    if (v >= needed) then
        if (min >= v) then
            min = v
        end 
    end
end
print("Part 2: " .. min)