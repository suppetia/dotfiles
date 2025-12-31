local helpers = require("luasnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual
local line_begin = helpers.line_begin

local tex_helpers = require("luasnip.luasnip-helper-tex")
local th = tex_helpers

local k = require("luasnip.nodes.key_indexer").new_key

return {
  s({ trig = "mk", desc = "inline math mode", snippetType = "autosnippet" }, fmta("$<>$", i(1))),
  s(
    { trig = "dm", desc = "math mode", snippetType = "autosnippet" },
    fmta(
      [[
    \[
      <>
    \]

  ]],
      d(1, get_visual)
    )
  ),
  s(
    { trig = "=>", desc = "implies", snippetType = "autosnippet", wordTrig = false, condition = th.in_mathzone },
    t("\\implies")
  ),
  s(
    { trig = "=<", desc = "implied by", snippetType = "autosnippet", wordTrig = false, condition = th.in_mathzone },
    t("\\impliedby")
  ),
  s(
    { trig = "iff", desc = "iff", snippetType = "autosnippet", wordTrig = true, condition = th.in_mathzone },
    t("\\iff")
  ),
  s(
    { trig = "//", desc = "fraction 1", snippetType = "autosnippet", wordTrig = false, condition = th.in_mathzone },
    fmta("\\frac{<>}{<>}", { d(1, get_visual), i(2) })
  ),
  s({
    -- trig = "((%d+)|(%d*)(\\)?([A-Za-z]+)((%^|_)(%{%d+%}|%d))*)/",
    -- trig = "((%d*)(\\)?(%a+)([%^_]%{?[%w\\]+%})*)/",
    trig = "(%S+)%/",
    desc = "fraction 2",
    snippetType = "autosnippet",
    wordTrig = false,
    regTrig = true,
    condition = th.in_mathzone,
  }, fmta("\\frac{<>}{<>}", { f(helpers.get_regexmatch), i(1) })),
  s(
    {
      trig = "(.+)%s%s",
      desc = "& in matrix/tables",
      snippetType = "autosnippet",
      wordTrig = false,
      regTrig = true,
      condition = th.in_envs("array", "tabular", "pmatrix", "bmatrix"),
    },
    f(function(_, snip)
      return snip.captures[1] .. " & "
    end, {})
  ),
}
