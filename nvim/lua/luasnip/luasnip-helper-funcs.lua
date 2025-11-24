local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end
-- condition to start a snippet at the beginning of a line
M.line_begin = require("luasnip.extras.expand_conditions").line_begin
M.not_preceeded_by = require("luasnip.extras.expand_conditions").trigger_not_preceded_by

return M
