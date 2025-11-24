local helpers = require("luasnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual
local line_begin = helpers.line_begin

local tex_helpers = require("luasnip.luasnip-helper-tex")
local th = tex_helpers

local k = require("luasnip.nodes.key_indexer").new_key
local k_filename = k("k_filename")

return {
  s(
    { trig = "beg", dscr = "A generic new environment", condition = line_begin, snippetType = "autosnippet" },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}

      ]],
      { i(1), i(2), rep(1) }
    )
  ),
  s(
    { trig = "eqq", dscr = "equation environment", condition = line_begin, snippetType = "autosnippet" },
    fmta(
      [[
        \begin{equation}
          <>
        \end{equation}

      ]],
      { i(1) }
    )
  ),
  s(
    { trig = "ali", dscr = "align environment", condition = line_begin, snippetType = "autosnippet" },
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}

      ]],
      { d(1, get_visual) }
    )
  ),
  s(
    { trig = "fig", dscr = "figure environment", condition = line_begin },
    fmta(
      [[
        \begin{figure}[<>]
          \centering
          <>
          \caption{<>}
          \label{fig:<>}
        \end{figure}

      ]],
      {
        i(1, "htpb"),
        c(2, {
          sn(
            nil,
            fmta([[ \\includegraphics[width=<>\\textwidth]{<>} ]], { i(1, ".8"), i(2, "", { key = "k_filename" }) })
          ),
          sn(
            nil,
            fmta([[ \\includesketch[width=<>\\textwidth]{<>} ]], { i(1, ".8"), i(2, "", { key = "k_filename" }) })
          ),
          sn(nil, { t(""), i(2, "", { key = "k_filename" }) }),
        }),
        i(3, "Caption"),
        -- d(4, function(args)
        --   local fname = args[1] or "hello"
        --   return sn(nil, { i(1, fname:gsub("%.", "-")) })
        -- end, { k("k_filename") }), -- <-- pass the key object here
        i(4, "label"),
      }
    )
  ),
  s(
    { trig = "tikz", dscr = "Tikz picture", condition = line_begin },
    fmta(
      [[
      \begin{center}
      \begin{tikzpicture}
      <>
      \end{tikzpicture}
      \end{center}
      ]],
      i(0)
    )
  ),
  s(
    { trig = "enum", dscr = "enumerate", condition = line_begin, snippetType = "autosnippet" },
    fmta(
      [[
      \begin{enumerate}<>
        \item <>
      \end{enumerate}
      ]],
      {
        c(1, {
          sn(nil, { t("[label="), i(1, "(\\roman*)"), t(",nosep]") }),
          sn(nil, { t("["), i(1, "nosep"), t("]") }),
          t(""),
        }),
        i(0),
      }
    )
  ),
  s(
    { trig = "item", dscr = "itemize", condition = line_begin, snippetType = "autosnippet" },
    fmta(
      [[
      \begin{itemize}<>
        \item <>
      \end{itemize}
      ]],
      {
        c(1, {
          sn(nil, { t("["), i(1, "nosep"), t("]") }),
          t(""),
        }),
        i(0),
      }
    )
  ),
  s(
    { trig = "pac", dscr = "include package", condition = line_begin },
    fmta("\\usepackage<>{<>}", {
      c(1, {
        sn(nil, { t("["), i(1, "options"), t("]") }),
        t(""),
      }),
      i(2),
    })
  ),
}
