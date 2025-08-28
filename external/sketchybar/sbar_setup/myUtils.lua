function Split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function Deduplicate(t)
    local seen = {}
    local res = {}

    for _, v in ipairs(t) do
        if not seen[v] then
            seen[v] = true
            res[#res + 1] = v
        end
    end

    return res
end

function RunCommand(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*all")
    handle:close()
    return result
end

local function tableToString(tbl, indent)
    indent = indent or 0
    local prefix = string.rep("  ", indent)
    local lines = {}

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            table.insert(lines, prefix .. tostring(k) .. ":")
            table.insert(lines, tableToString(v, indent + 1))
        else
            table.insert(lines, prefix .. tostring(k) .. ": " .. tostring(v))
        end
    end

    return table.concat(lines, "\n")
end

function ToStringUtil(value)
    if type(value) == "table" then
        return tableToString(value)
    elseif type(value) == "number" then
        -- simplifyNumber(value)
        return tostring(value)
    else
        return tostring(value)
    end
end

function WriteUtil(value, filename)
    value = ToStringUtil(value)

    local tmpFilename = filename .. ".tmp"

    local tmpFile, err = io.open(tmpFilename, "w")
    if not tmpFile then
        return false, "Error opening temp file: " .. err
    end

    local ok, write_err = tmpFile:write(value)
    tmpFile:close()

    if not ok then
        os.remove(tmpFilename)
        return false, "Error writing to temp file: " .. write_err
    end

    local success, rename_err = os.rename(tmpFilename, filename)
    if not success then
        os.remove(tmpFilename)
        return false, "Error renaming temp file: " .. rename_err
    end

    return true, nil
end
