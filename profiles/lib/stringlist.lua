local Stringlist = {}

-- Takes a string representing a list separated by delim and canonicalizes containing spaces.
--
-- Example:
-- In: aaa;bbb; ccc;  d;dd"
-- Out: aaa; bbb; ccc; d; dd"
function Stringlist.canonicalize_spaces(str, delim)
  local rv = str

  if not str or str == "" or not delim or delim == "" then
    return rv
  end

  local pattern = delim .. "%s*([^" .. delim .. "])"
  --              ^ starts with delimiter
  --                         ^ some optional spaces
  --                             ^ everything not delimiter

  local replacement = delim .. " %1"
  --                            ^ only single space

  rv = string.gsub(str, pattern, replacement)

  return rv
end

return Stringlist
