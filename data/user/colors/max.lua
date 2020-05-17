local style = require "core.style"
local common = require "core.common"

-- Max’s colors

style.background = { common.color "#ffffff" }
style.background2 = { common.color "#eaeaea" }
style.background3 = { common.color "#eaeaea" }
style.text = { common.color "#000000" }
style.caret = { common.color "#333333" }
style.accent = { common.color "#0d52bf" }
style.dim = { common.color "#7e8087" }
style.divider = { common.color "#abacae" }
style.selection = { common.color "#8cd5ff" }
style.line_number = { common.color "#d0d0d0" }
style.line_number2 = { common.color "#808080" }
style.line_highlight = { common.color "#ffffff" }
style.scrollbar = { common.color "#95a3ab" }
style.scrollbar2 = { common.color "#485a6c" }

style.syntax["normal"] = { color={ common.color "#000000" } }
style.syntax["symbol"] = { color={ common.color "#000000" } }
style.syntax["comment"] = { color={ common.color "#3689e6" }, font='code_font_italic' }
style.syntax["keyword"] = { color={ common.color "#000000" }, font='code_font_bold' }
style.syntax["keyword2"] = { color={ common.color "#000000" }, font='code_font_italic' }
style.syntax["number"] = { color={ common.color "#333333" } }
style.syntax["literal"] = { color={ common.color "#333333" }, font='code_font_bold' }
style.syntax["string"] = { color={ common.color "#c6262e" } }
style.syntax["operator"] = { color={ common.color "#273445" },  }
style.syntax["function"] = { color={ common.color "#452981" } }
