local helpers = require("luasnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual
local line_begin = helpers.line_begin

local tex_helpers = require("luasnip.luasnip-helper-tex")
local th = tex_helpers

return {
  s(
    {
      trig = "(:+)(%w)",
      desc = "Greek symbols",
      regTrig = true,
      wordTrig = false,
      condition = th.in_mathzone,
      snippetType = "autosnippet",
    },
    f(function(args, snip)
      local symbols = {
        ["a"] = "alpha",
        ["b"] = "beta",
        ["y"] = "gamma",
        ["d"] = "delta",
        ["e"] = "epsilon",
        ["f"] = "phi",
        ["p"] = "psi",
        ["w"] = "omega",
        ["z"] = "zeta",
        ["x"] = "zeta",
        ["t"] = "theta",
        ["m"] = "mu",
        ["l"] = "lambda",
        ["s"] = "sigma",
        ["r"] = "rho",
        ["n"] = "eta",
        ["v"] = "nu",
        ["k"] = "kappa",
      }
      local varsymbols = {
        ["f"] = true,
        ["t"] = true,
        ["e"] = true,
      }
      val = symbols[string.lower(snip.captures[2])]
      if not val then
        return snip.captures[1] .. snip.captures[2]
      else
        local prefix = "\\"
        -- if two colons are used, use the var variant
        if (snip.captures[1] == "::") and varsymbols[snip.captures[2]] then
          prefix = prefix .. "var"
        end
        if string.match(snip.captures[1], "%u") then
          -- if the trigger was upper case use the upper case letter
          return prefix .. val:gsub("^%l", string.upper)
        else
          return prefix .. val
        end
      end
    end, {})
  ),
}
