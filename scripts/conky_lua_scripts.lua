--- Pads str to length len with char from right
function lpad(str, len, char)
    if char == nil then char = ' ' end
    return str .. string.rep(char, len - #str)
end

--- Pads str to length len with char from left
function rpad(str, len, char)
    if char == nil then char = ' ' end
    return string.rep(char, len - #str) .. str
end

function conky_format(format, number)
    return string.format(format, conky_parse(number))
end

function conky_lpad(len, str)
    return rpad(conky_parse(str), len, ' ')
end
