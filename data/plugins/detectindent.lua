local core = require "core"
local command = require "core.command"
local config = require "core.config"
local DocView = require "core.docview"
local Doc = require "core.doc"

local cache = setmetatable({}, { __mode = "k" })


local function detect_indent(doc)
  local samples, n_samples = {}, 100
  for _, text in ipairs(doc.lines) do
    if #samples == n_samples then break end
    local str = text:match("^  +")
    if str then samples[#samples+1] = {style="soft", num=#str} end
    local str = text:match("^\t+")
    if str then samples[#samples+1] = {style="hard"} end
  end
  -- Pick most common indent style
  local hard, soft = 0, 0
  for _, sample in ipairs(samples) do
    if sample.style == "hard" then hard = hard + 1
    elseif sample.style == "soft" then soft = soft + 1 end
  end
  if hard > soft then
    return "hard"
  end
  local nums, most_common = {}, nil
  for _, sample in ipairs(samples) do
    if sample.style == "soft" then
      nums[sample.num] = (nums[sample.num] or 0) + 1
    end
  end
  for num, count in pairs(nums) do
    if not most_common or nums[most_common] < count then
      most_common = num
    end
  end
  return "soft", most_common
end


local function update_cache(doc)
  local type, size = detect_indent(doc)
  if type then
    cache[doc] = { type = type, size = size }
  end
end


local new = Doc.new
function Doc:new(...)
  new(self, ...)
  update_cache(self)
end

local clean = Doc.clean
function Doc:clean(...)
  clean(self, ...)
  update_cache(self)
end


local function with_indent_override(doc, fn, ...)
  local c = cache[doc]
  if not c then
    return fn(...)
  end
  local type, size = config.tab_type, config.indent_size
  config.tab_type, config.indent_size = c.type, c.size or config.indent_size
  local r1, r2, r3 = fn(...)
  config.tab_type, config.indent_size = type, size
  return r1, r2, r3
end


local perform = command.perform
function command.perform(...)
  return with_indent_override(core.active_view.doc, perform, ...)
end


local draw = DocView.draw
function DocView:draw(...)
  return with_indent_override(self.doc, draw, self, ...)
end

