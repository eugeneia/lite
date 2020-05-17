local syntax = require "core.syntax"

syntax.add {
  files = "%.lisp$",
  comment = ";",
  patterns = {
    { pattern = "#\\[^%s)]+",       type = "string"   },
    { pattern = { '"', '"', '\\' },       type = "string"   },
    { pattern = { '#[pP]"', '"', '\\' },  type = "string"   },
    { pattern = { "#%|", "%|#"},          type = "comment"  },
    { pattern = { ";+", "\n"},            type = "comment"  },
    { pattern = "-?#[xob]%x+",            type = "number"   },
    { pattern = "-?%d+[%d%.eEdD]*",       type = "number"   },
    { pattern = "-?%.?%d+",               type = "number"   },
    { pattern = "[%w_/%-%%%*%+%.]+::?",   type = "symbol"   },
    { pattern = ":[%w_/%-%%%*%+%.]+",     type = "symbol"  },
    { pattern = "[`']",                   type = "operator"  },
    { pattern = ",@?",                    type = "operator"  },

  },
  symbols = {
    ["t"]     = "literal",
    ["nil"]   = "literal",
  },
}

