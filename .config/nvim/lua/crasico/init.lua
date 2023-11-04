require("crasico.remap")
require("crasico.lazy")

local options = vim.opt

-- Setup Tabs
local TAB_WIDTH = 4
options.tabstop = TAB_WIDTH 
options.softtabstop = TAB_WIDTH 
options.shiftwidth = TAB_WIDTH 

-- Setup Line Numbers
options.relativenumber = true
