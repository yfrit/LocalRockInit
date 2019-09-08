--find rockspecs file
local lfs = require("lfs")
local filePath
for name in lfs.dir(".") do
    if name:find(".rockspec") then
        filePath = name
    end
end
assert(filePath, "Cannot use LocalRockInit, repository doesn`t have a rockspec file.")

--open rockspecs file
local file = io.open(filePath)
local code = file:read("*a")
file:close()

--turn its globals into a table, to prevent side-effects
code = code:gsub("\r", "")
code = code:gsub('"\n', '",\n')
code = code:gsub("}\n", "},\n")
code = string.format([[
    return {
        %s
    }
]], code)

--get the builds.modules table
local loadedString = loadstring(code)
assert(loadedString, "Invalid code:\n" .. code)
local modules = loadedString().build.modules

--iterate it to get full and local paths
local overrides = {}
for fullPath, localPath in pairs(modules) do
    overrides[fullPath] = localPath:gsub(".lua", "")
end

--override require to return local files
local oldRequire = _G.require
function _G.require(path, ...)
    path = overrides[path] or path
    return oldRequire(path, ...)
end
